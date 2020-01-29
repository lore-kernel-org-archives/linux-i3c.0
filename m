Return-Path: <SRS0=sARy=3U=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FF9C33CB2
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jan 2020 12:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335EC206F0
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jan 2020 12:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I3SgS4QC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fH0Ti3or"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335EC206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SwDDEWqBWD8vrLCyzNdaBVswp4zAgrGS3HV66LLgVJo=; b=I3S
	gS4QCUk/yxsBu/RCPAx2vrujdUo+dsazXvtgl9T5heDB3+wx8XkYoXlfASGrqgW11eUpqL0bunFHr
	R7eMwj2LGG9BlS3jXQ4bAxlvFvmw2IoNImGSVgjWiFEHUtxpa3hff1gOY5L3K5h5LhX3MES8DlB8H
	Skx3uriVc/n8WhMaLaww8HJRcPD1qy3lPuZXq5lHMWrC7pQK6jJIzGnxK9qhhJz879QZsUHdAcwIq
	msOtgEghqpbzNvMwJlgHcpYk8uIVyOiKgiWfX1sV7Ed1rja5KIykZh1hH5a2/nrZB9UriJIejbPhU
	kx6ufWrG/QzUmSuXXhMNrOuukj2jYDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixVLj-0006CC-Ky; Fri, 31 Jan 2020 12:24:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwmHw-0001DX-Qp
 for linux-i3c@lists.infradead.org; Wed, 29 Jan 2020 12:17:46 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8D3E54082B;
 Wed, 29 Jan 2020 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580300264; bh=THplBxZ0iV9F6K6doQzhuA0Zoa7QrZvTKvia+grxBPY=;
 h=From:To:Cc:Subject:Date:From;
 b=fH0Ti3orXuqtTvNNatvWyna/wAvShh0qvfkPulaqXGhwS+ToO7KzQxU18vwbBhowI
 yhpdd+5Rnp7k/Zs2jM5liMQV/tKK8v2fBfValrewrE8X1+i690PszpxrvPEfhgB99z
 9MAluDbT8PXmR2PgCtyZfxmiJ8yV0v4BlbVGhq0huKpDvOsSdrzAi4wkZt5e3+/qPP
 XAjqUweizL6xxSPFXfeAwgaCeCnJNvyDciE0Rf92t5ZIDWowKPoqVLJY07BTo9Ysmh
 mp6uQUMPRxckxHgjYh599yewIR53JaAp5zoqE3EB8GIe9l+VNNF+j6+7m9Iz/XbGJ2
 L+hrda14VbteA==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 3CDDBA006E;
 Wed, 29 Jan 2020 12:17:38 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 2731E3F031;
 Wed, 29 Jan 2020 13:17:38 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [RFC v2 0/4] Introduce i3c device userspace interface
Date: Wed, 29 Jan 2020 13:17:31 +0100
Message-Id: <cover.1580299067.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_041744_869277_A62F31A3 
X-CRM114-Status: GOOD (  14.93  )
X-Mailman-Approved-At: Fri, 31 Jan 2020 04:24:38 -0800
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
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 wsa@the-dreams.de, gregkh@linuxfoundation.org, bbrezillon@kernel.org,
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

Changes in v2:
  Use IDR api for minor numbering
  Modify ioctl struct
  Fix SPDX license

Vitor Soares (4):
  i3c: master: export i3c_masterdev_type
  i3c: master: export i3c_bus_type symbol
  i3c: master: add i3c_for_each_dev helper
  i3c: add i3cdev module to expose i3c dev in /dev

 drivers/i3c/Kconfig             |  15 ++
 drivers/i3c/Makefile            |   1 +
 drivers/i3c/i3cdev.c            | 429 ++++++++++++++++++++++++++++++++++++++++
 drivers/i3c/internals.h         |   2 +
 drivers/i3c/master.c            |  16 +-
 include/uapi/linux/i3c/i3cdev.h |  38 ++++
 6 files changed, 500 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i3c/i3cdev.c
 create mode 100644 include/uapi/linux/i3c/i3cdev.h

-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
