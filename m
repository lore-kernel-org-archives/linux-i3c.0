Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0677C34050
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C832465A
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vq8HoweK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dICGGJNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C832465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MGQIfQxOH2kPHfv9D2X3y241WBHbTPpY9JXe9GcElRg=; b=Vq8
	HoweKdWquCBkPdm2QGyNaRTAlCd5tgBrBKppMs2O3mSVWsbfninf1Noe7EVvx3jh+8liAMNOaNXjh
	W2u89RH5wOBCtphDMfYgP/rgssmvDEBCL/Z6uxuLpxlWsnKL8op/ybnDSvZFcZgZbXuAS0QMYAZSc
	TbiS+Ung7BNGYXlfSMI121fzjTfH/6MF1x0MTnFp6s99TtQZ1rPtZRH0Rp9FV1C73u853H9CXI/M5
	A7xWQCEUj4zjoHz5KO6zFw+qIXn2T8QrFar/EXFL0mKZ6F9PJZeeXDocYiA1PX52y3zpxiND+xnO5
	jhqHVAMU1EYHkapy5OciVP0ZaYyPwfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4D6p-0007be-8B; Wed, 19 Feb 2020 00:20:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4D6l-0007Xe-4e
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 00:20:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 11BA0C0098;
 Wed, 19 Feb 2020 00:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582071650; bh=ddKM9xkbcpuB2cBOgjOc0jvYyLJYZ6mC3oVxtJxau2Q=;
 h=From:To:Cc:Subject:Date:From;
 b=dICGGJNh6vH/STWxR/oej8fNp8Uuz1I5m9moEHsNCMPpZzmSOiUYAzPKGJALDy5lc
 E/+2+5+el+eeqNre6i3Cil92pMdXZzU2+gbsclmQjztrsbRIAyeBH6YAMvI1PWuAU5
 RoTmjkTcLdyP1YmL4yzGPupCDMo17kugkYDgUPWgqXOdhea0m1eT+0oPU9Me56hKJg
 gMMeNCbqOXf8h9EOYm21f97u9mqka3tBAddnqU3TLKXO4X0RAHKrIEAOmtxgurl5Rj
 S3jRzA4krL0PaJYmwiQz6EmTbDLGc+b11s1HXgwQ0xF1dpcfLXh1UYEsx/4KzHVgWk
 oEKyAyBDgnbOQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 34E31A007B;
 Wed, 19 Feb 2020 00:20:47 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id E39B73D240;
 Wed, 19 Feb 2020 01:20:46 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 0/5] Introduce i3c device userspace interface
Date: Wed, 19 Feb 2020 01:20:38 +0100
Message-Id: <cover.1582069402.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_162055_260269_FF18356D 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, gregkh@linuxfoundation.org,
 bbrezillon@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 broonie@kernel.org
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
  dev/bus/i3c/<bus>-<pid>

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

Changes in v3:
  Use the xfer_lock to prevent device detach during ioctl call
  Expose i3cdev under /dev/bus/i3c/ folder like usb does
  Change NOTIFY_BOUND to NOTIFY_BIND, this allows the device detach occur
  before driver->probe call
  Avoid use of IS_ERR_OR_NULL
  Use u64_to_user_ptr instead of (void __user *)(uintptr_t) cast
  Allocate k_xfer and data_ptrs at once and eliminate double allocation
  check
  Pass i3cdev to dev->driver_data
  Make all minors available
  Add API documentation

Changes in v2:
  Use IDR api for minor numbering
  Modify ioctl struct
  Fix SPDX license

Vitor Soares (5):
  i3c: master: export i3c_masterdev_type
  i3c: master: export i3c_bus_type symbol
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev
  Documentation: userspac-api: add i3cdev documentation

 Documentation/userspace-api/i3c/i3cdev.rst | 116 ++++++++
 drivers/i3c/Kconfig                        |  15 +
 drivers/i3c/Makefile                       |   1 +
 drivers/i3c/i3cdev.c                       | 429 +++++++++++++++++++++++++++++
 drivers/i3c/internals.h                    |   2 +
 drivers/i3c/master.c                       |  16 +-
 include/uapi/linux/i3c/i3cdev.h            |  38 +++
 7 files changed, 616 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/i3c/i3cdev.rst
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
