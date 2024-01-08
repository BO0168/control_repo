class minecraft {
  file {‘/opt/minecraft’:
    ensure => directory,
  }
  file {‘/opt/minecraft/server.jar’:
    ensure => file,
    source      => 'https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar',
  }
  archive { '/opt/minecraft/openjdk-21.0.1_linux-x64_bin.tar.gz':
    ensure        => present,
    extract       => true,
    extract_path  => '/opt/minecraft',
    source        => 'https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_linux-x64_bin.tar.gz',
    checksum      => '7e80146b2c3f719bf7f56992eb268ad466f8854d5d6ae11805784608e458343f',
    checksum_type => 'sha256',
    creates       => '/opt/minecraft/jdk-21.0.1',
    cleanup       => true,
  }
  file {‘/opt/minecraft/eula.txt’:
    ensure => file,
    content => ‘eula=true’
  }
  file {‘/etc/systemd/system/minecraft.service’:
    ensure => file,
    source => ‘puppet:///modules/minecraft/minecraft.service’,
  }
  service { ‘minecraft’:
    ensure => running,
    enable => true,
  }
}
