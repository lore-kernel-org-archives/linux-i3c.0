Return-Path: <SRS0=3k/h=O4=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85722C43612
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Dec 2018 15:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BC8218D3
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Dec 2018 15:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="icUvPHsp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BC8218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jelHMwRFCFjd7DyIScFv1ju1ryEM4h+hFkU/OT2XM+0=; b=icUvPHspj3LiAe
	UwRJmxPBxyEanTtTgGzK4wPNPC/PAFV4p6A1OOKdPGfNEXgKjZbvHKREti0gKGZYVIhuDhaH5RD9b
	wVxY0kGeEXZmlTSeCAsIyCnvGstYJh8Z/nyi4IvNJTYDd1Zi5f+AT1+wPTZpybl9OlS88t0HyX+CZ
	mdVP9iyx+1c745ADgc0lS7SpcUy7COqzxf0y3vZvNcR4HGPU3ovrsjA58Z4dQWgMn5p0Bfz7IrKEp
	OPgkkpHjcI6yr3mAbnvKqCTjXnhg48It1LRvUms9BrycE64RV9sxuMvVMEz4KPDKdIZWZduBFRn2U
	HFrPKqBlDJiu5DK+SP6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZeEu-0006pQ-My; Wed, 19 Dec 2018 15:58:28 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZeBi-0003rg-K7
 for linux-i3c@lists.infradead.org; Wed, 19 Dec 2018 15:55:12 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id E7F3420A82; Wed, 19 Dec 2018 16:54:57 +0100 (CET)
Received: from bbrezillon (aaubervilliers-681-1-38-38.w90-88.abo.wanadoo.fr
 [90.88.157.38])
 by mail.bootlin.com (Postfix) with ESMTPSA id A19E8206A7;
 Wed, 19 Dec 2018 16:54:47 +0100 (CET)
Date: Wed, 19 Dec 2018 16:54:47 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] i3c: Initial pull request
Message-ID: <20181219165447.2db6a689@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_075510_932727_5880C297 
X-CRM114-Status: GOOD (  15.09  )
X-Mailman-Approved-At: Wed, 19 Dec 2018 07:58:27 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Rafal Ciepiela <rafalc@cadence.com>, Arnd Bergmann <arnd@arndb.de>,
 Wolfram Sang <wsa@the-dreams.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>,
 linux-i3c <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the first PR for the I3C subsystem, and this times it comes
even before the merge window is open (which I hope is not a problem :-/).
Let me know if it's too early and I'll try to resend it next week.

Regards,

Boris

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-4.21

for you to fetch changes up to 25ac3da61ba144f8dbfe377eeec6b1da7ad0854a:

  i3c: master: cdns: fix I2C transfers in Cadence I3C master driver (2018-12-12 17:08:32 +0100)

----------------------------------------------------------------
Add initial support for I3C along with 2 I3C master controller drivers.

----------------------------------------------------------------
Boris Brezillon (7):
      i3c: Add core I3C infrastructure
      docs: driver-api: Add I3C documentation
      i3c: Add sysfs ABI spec
      dt-bindings: i3c: Document core bindings
      MAINTAINERS: Add myself as the I3C subsystem maintainer
      i3c: master: Add driver for Cadence IP
      dt-bindings: i3c: Document Cadence I3C master bindings

Colin Ian King (1):
      i3c: master: dw: fix mask operation by using the correct operator

Dan Carpenter (2):
      i3c: fix an error code in i3c_master_add_i3c_dev_locked()
      ic3: off by one in mode_show()

Przemyslaw Gaj (1):
      i3c: master: cdns: fix I2C transfers in Cadence I3C master driver

Vitor Soares (3):
      i3c: master: Add driver for Synopsys DesignWare IP
      dt-binding: i3c: Document Synopsys DesignWare I3C
      MAINTAINERS: Add myself as the dw-i3c-master module maintainer

YueHaibing (1):
      i3c: master: Remove set but not used variable 'old_i3c_scl_lim'

 Documentation/ABI/testing/sysfs-bus-i3c                      |  146 ++
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt    |   43 +
 Documentation/devicetree/bindings/i3c/i3c.txt                |  138 ++
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt |   41 +
 Documentation/driver-api/i3c/device-driver-api.rst           |    9 +
 Documentation/driver-api/i3c/index.rst                       |   11 +
 Documentation/driver-api/i3c/master-driver-api.rst           |    9 +
 Documentation/driver-api/i3c/protocol.rst                    |  203 +++
 Documentation/driver-api/index.rst                           |    1 +
 MAINTAINERS                                                  |   18 +
 drivers/Kconfig                                              |    2 +
 drivers/Makefile                                             |    2 +-
 drivers/i3c/Kconfig                                          |   24 +
 drivers/i3c/Makefile                                         |    4 +
 drivers/i3c/device.c                                         |  233 +++
 drivers/i3c/internals.h                                      |   26 +
 drivers/i3c/master.c                                         | 2659 ++++++++++++++++++++++++++++++++++
 drivers/i3c/master/Kconfig                                   |   22 +
 drivers/i3c/master/Makefile                                  |    2 +
 drivers/i3c/master/dw-i3c-master.c                           | 1216 ++++++++++++++++
 drivers/i3c/master/i3c-master-cdns.c                         | 1666 +++++++++++++++++++++
 include/linux/i3c/ccc.h                                      |  385 +++++
 include/linux/i3c/device.h                                   |  331 +++++
 include/linux/i3c/master.h                                   |  648 +++++++++
 include/linux/mod_devicetable.h                              |   17 +
 25 files changed, 7855 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i3c
 create mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
 create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
 create mode 100644 Documentation/driver-api/i3c/device-driver-api.rst
 create mode 100644 Documentation/driver-api/i3c/index.rst
 create mode 100644 Documentation/driver-api/i3c/master-driver-api.rst
 create mode 100644 Documentation/driver-api/i3c/protocol.rst
 create mode 100644 drivers/i3c/Kconfig
 create mode 100644 drivers/i3c/Makefile
 create mode 100644 drivers/i3c/device.c
 create mode 100644 drivers/i3c/internals.h
 create mode 100644 drivers/i3c/master.c
 create mode 100644 drivers/i3c/master/Kconfig
 create mode 100644 drivers/i3c/master/Makefile
 create mode 100644 drivers/i3c/master/dw-i3c-master.c
 create mode 100644 drivers/i3c/master/i3c-master-cdns.c
 create mode 100644 include/linux/i3c/ccc.h
 create mode 100644 include/linux/i3c/device.h
 create mode 100644 include/linux/i3c/master.h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
