Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB40C77B76
	for <linux-i3c@archiver.kernel.org>; Sun, 16 Apr 2023 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H1cX/33ZJJv9o86EoPnwrip3rNPYwU6NqqEmO9KIU9E=; b=wB+YdUJshEMVoI
	vTcYq4Jk2c4L5sNd752YQJZCu7XDct1MlJZnTPbzAk54ouSTWQ7dr0C4swvZSF8+JniFJ7tSdPgt+
	qJtaihhFWbHPYUGD/a7tyJXH+3sHopbg9Ce6/cJOw0hfZ6HCmS8KmcSWgxvVxQexbxfwT6iGCOzJr
	+noacEkAu1PJ7ZsGeWV1hDC/gk2xgEpebJuGZMTfMNvPEBZ1DqZsak65lDsrh1cLiJxkB32o15XGb
	zDlLuyV+rje5DDSYRbzPbYV3pwGhfiMK0ACVTGyqwrNcuYC2NvSPO1a0jQvlOp8JWJBKla1M/cN6w
	DKhVnZJU92hx2mdpFxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poAl9-00EUzU-18;
	Sun, 16 Apr 2023 22:22:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pms3o-005Mz7-2e
	for linux-i3c@lists.infradead.org;
	Thu, 13 Apr 2023 08:12:06 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 498002013A; Thu, 13 Apr 2023 16:11:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1681373511;
	bh=wv9kE/J4sws9dMMRkBqQdpalgv6SUkPHlfcUiCaqJ0M=;
	h=From:To:Cc:Subject:Date;
	b=a84pvQDIgDpAFqUpSJcs2GaIHRL8nSPJhEyiK9ZsJTPw9lbQ6rA5aGQj9W7fubr2N
	 uvA4Hx7lJsXpn7LoUE+D3Ih0k11W32G9Z1XQCjcERonYvTh5GPOaf75mxf/0FcRW8b
	 VkLmzZlAaWON9WFffj4pqIAoBfWT24bOQnoyZOpJGZ0Cb1WcUwj4n+WCsAEuKI4FIL
	 ulti2zekFHnDl1x8b9Hz0hZiYZJPIyo/4TV9FLCks1IKW7pmP29lhtwWeU2Gb+GxRi
	 Gv2SlQDCplPlS/RH+ZJtpVSXNSB8+E+H1prfakx/OgjYMDfjIuFL5MhbQYvKXIB4M3
	 SAzZLENcLBFeg==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [RFC PATCH 0/2] I3C MCTP net driver
Date: Thu, 13 Apr 2023 16:11:36 +0800
Message-Id: <20230413081139.15673-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_011205_214712_26209C7D 
X-CRM114-Status: GOOD (  10.07  )
X-Mailman-Approved-At: Sun, 16 Apr 2023 15:22:09 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This series adds an I3C transport for the kernel's MCTP network
protocol. MCTP is a communication protocol between system components
(BMCs, drives, NICs etc), with higher level protocols such as NVMe-MI or
PLDM built on top of it (in userspace). It runs over various transports
such as I2C, PCIe, or I3C.

The mctp-i3c driver follows a similar approach to the kernel's existing
mctp-i2c driver, creating a "mctpi3cX" network interface for each
numbered I3C bus. Busses opt in to support by adding a "mctp-controller"
property to the devicetree:

&i3c0 {
        mctp-controller;
}

The driver will bind to MCTP class devices (DCR 0xCC) that are on a
supported I3C bus. Each bus is represented by a `struct mctp_i3c_bus`
that keeps state for the network device. An individual I3C device
(struct mctp_i3c_device) performs operations using the "parent"
mctp_i3c_bus object. The I3C notify/enumeration patch is needed so that
the mctp-i3c driver can handle creating/removing mctp_i3c_bus objects as
required.

The mctp-i3c driver is using the Provisioned ID as an identifier for
target I3C devices (the neighbour address), as that will be more stable
than the I3C dynamic address. The driver internally translates that to a
dynamic address for bus operations.

The driver has been tested using an AST2600 platform, with Jeremy's
In-Band Interrupt support patches. A remote endpoint has been tested
against Qemu, as well as using the target mode support in Aspeed's
vendor tree.

I'm sending this as an RFC for linux-i3c, then will submit the mctp-i3c
driver itself to the netdev list after it has had review here.

Cheers,
Matt

Jeremy Kerr (1):
  i3c: Add support for bus enumeration & notification

Matt Johnston (1):
  mctp i3c: MCTP I3C driver

 drivers/i3c/master.c        |  35 ++
 drivers/net/mctp/Kconfig    |   9 +
 drivers/net/mctp/Makefile   |   1 +
 drivers/net/mctp/mctp-i3c.c | 778 ++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h  |  11 +
 5 files changed, 834 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
