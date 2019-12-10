Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ACAC00454
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ACD4206D5
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 15:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VkZOZF1J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bE8Cvb50"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ACD4206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1zxKS9cFTnz+5xt+4HUu10/pF7b8D2ppBP0m5ES0Q/s=; b=VkZ
	OZF1JtUrEbrAGWKVbSKsVjHNAZM+xMJbCpDRmAfEJV25nV1VmOgwn7VstVCKVTVYgW/7/VvYTL84A
	qtavePcBVeiD2v+/Nra8gFwbADwoPC9o5EqVuoz1yVyQLjY0aUSKJ2Tn81wbWG0ZlcceOn0vdwlda
	f+PuqcpBx32o8UTZvYr7VEXKoTfgmEyY0hvND3erKu2KmO8UrG+HaIoZkPUzVX7EjulsQrrVQVdvd
	uSaVKFruy8WziIBZRwEaVy+6QlY40fFbWC3Ku5aAL7ZBh3OPA+/mIAswlr59gGePTbN7ErjXCqPaL
	+80cEu27DJFmehyuNw3/h0+VAISM5Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieha4-00043i-Nh; Tue, 10 Dec 2019 15:37:44 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieha1-0003qQ-7O
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 15:37:43 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21414405E0;
 Tue, 10 Dec 2019 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575992259; bh=fYuY0lyYqVPq+/KbacWe8P4uzxJ1IsIgZmjZKUwsUeo=;
 h=From:To:Cc:Subject:Date:From;
 b=bE8Cvb50ctNvJTv8ONaR0ziSsoWGdFlr4d0SeLDUx/4mQ3Ilmc5iXrEYAVNHQweog
 p0ntUaFjRp3ft9wkJBVkxMzPvKz1pqYRgkufGMWCbwkZ9NXYahiIGpJUYSEa3MsLx5
 dXAhg+bRyviaj8e27S+X92G+9Q3jKys2PYiITdTiX0HQ63AicK680Y+8jUXtxAFKul
 oacBoagqV0+wbwg8wsOdPqTzbe5npiUcD5GcOqmPRsHc2Ac9zunPWnadZFIzVBlCQQ
 tmG3QQSpw2xQzKKbchFJCgFdqQjK6/qaSkL3MQ5S2K0ZlawvtAmMx+VBOOHguMzItY
 UcK9HmM5/MldA==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9AAA5A005D;
 Tue, 10 Dec 2019 15:37:36 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 691303E2CC;
 Tue, 10 Dec 2019 16:37:36 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [RFC 0/5] Introduce i3c device userspace interface
Date: Tue, 10 Dec 2019 16:37:28 +0100
Message-Id: <cover.1575977795.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_073741_289959_5880DC02 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, arnd@arndb.de, wsa@the-dreams.de,
 gregkh@linuxfoundation.org, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, broonie@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

For today there is no way to use i3c devices from user space and
the introduction of such API will help developers during the i3c device
or i3c host controllers development.

The i3cdev module is highly based on i2c-dev and yet I tried to address
the concerns raised in [1].

NOTES:
- The i3cdev dynamically request an unused major number.

- The i3c devices are dynamically exposed/removed from dev/ folder based
  on if they have a device driver bound to it.

- For now, the module exposes i3c devices without device driver on
  dev/i3c-<bus>-<pid>, but we can change the path to
  dev/bus/i3c/<bus>-<pid> or dev/i3c/<bus>-<pid>.

- As in the i2c subsystem, here it is exposed the i3c_priv_xfer to
  userspace. I tried to use a dedicated structure as in spidev but I don't
  see any obvious advantage.

- Since the i3c API only exposes i3c_priv_xfer to devices, for now, the
  module just makes use of one ioctl(). This can change in the future with
  the introduction hdr commands or by the need of exposing some CCC
  commands to the device API (private contract between master-slave).
  Regarding the i3c device info, some information is already available
  through sysfs. We can add more device attributes to expose more
  information or add a dedicated ioctl() request for that purpose or both.

- Similar to i2c, I have also created a tool that you can find in [2]
  for testing purposes. If you have some time available I would appreciate
  your feedback about it as well.

[1] https://lkml.org/lkml/2018/11/15/853
[2] https://github.com/vitor-soares-snps/i3c-tools.git

Vitor Soares (5):
  i3c: master: export i3c_masterdev_type
  i3c: master: export i3c_bus_type symbol
  i3c: device: expose transfer strutures to uapi
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 drivers/i3c/Kconfig             |  15 ++
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 438 ++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/internals.h         |   2 +
 drivers/i3c/master.c            |  16 +-
 include/linux/i3c/device.h      |  54 +----
 include/uapi/linux/i3c/device.h |  66 ++++++
 include/uapi/linux/i3c/i3cdev.h |  27 +++
 8 files changed, 565 insertions(+), 54 deletions(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/device.h
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
