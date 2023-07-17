Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9337DC0015E
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Jul 2023 04:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b9VGbUrqHBlB2H3VP2VatfPkByahj959HRkqldi2jNg=; b=4GTv9hgRK8QxtZ
	6FAnCQ6ZqQncP1vGRNNXbTpEMJt3VFObcjldV7IBwJI0myq7ioto12M76tD/iqOqoiF0/TOeMrZsc
	qXonjGsFjgD2IsSpqxoQDn667M+BalKxdwTiStKV/A2uBthdvfclt6i10o7aBb2mDvDZ3QesJ13sM
	sdXh8EP6Un2wpSIoDl0geglrHvyuvISqpztgHHLTreJpNX/DxJGLwyxu0QRWy1rqiJBiZtry108/l
	XRIE3rzH6RIC8WhLlwGjKUu5dAtXDg3r6yyqB4A/qWv6L3lE8CDTZ0fsmBt99WT31cScmBUNWKV87
	Bx2HczZT/C6h7ybxbVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFW8-001mbr-2W;
	Mon, 17 Jul 2023 04:07:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLFW2-001mS0-35
	for linux-i3c@lists.infradead.org;
	Mon, 17 Jul 2023 04:07:20 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id AE8C72017A; Mon, 17 Jul 2023 12:07:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1689566827;
	bh=J4YSVvFjLnQ3mI1/zP8hCJYOjWeuxIwHszllpuTd1Jg=;
	h=From:To:Cc:Subject:Date;
	b=FpUThJTKq53oIkG7Ia3s49SoCqk6iAj4wCL2DreMi5ISkt2UgX+joM6nWNhs4aAMN
	 IQQ23roJntAoJ373YwT+YkLHkhf7gIygGq2kD/wyIjAZHqbWfyh+yQkPOl1OS72c1v
	 3X/a6jzgL3UeG2GkvRsBM+5c3EzpCX6MHeIjyDDbvAy1mAj0DTbjmJBwH1rYxnbpR8
	 zz79uD/SyK23lGVCiN77KgJkABVxv/rjg0euhyYQV9aFnwJiX32dtFogYqXTL6NUu5
	 R0+LUDmi4Et5ThQzkOM6nrF6v1uiYMPTmy7cQaTuTwp9EecXnqLX4nFH8ptV605J3r
	 wywx9XGYLLtUw==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next v2 0/3] I3C MCTP net driver
Date: Mon, 17 Jul 2023 12:06:35 +0800
Message-Id: <20230717040638.1292536-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_210719_252710_CB2E326A 
X-CRM114-Status: GOOD (  12.07  )
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

The driver has been tested using an AST2600 platform. A remote endpoint 
has been tested against Qemu, as well as using the target mode support 
in Aspeed's vendor tree.

I've rebased to net-next since that is the faster moving tree. If I3C 
maintainers would prefer I can submit the I3C bus enumeration patch 
by itself and let it take another cycle to get into net-next, though 
it wouldn't have any in-tree user. I'll leave that to maintainers.

Thanks,
Matt

---

v2:

- Rebased to net-next
- Removed unnecessary pr_ printing
- Fixed reverse christmas tree ordering
- Reworded DT property description to match I2C

Jeremy Kerr (1):
  i3c: Add support for bus enumeration & notification

Matt Johnston (2):
  dt-bindings: i3c: Add mctp-controller property
  mctp i3c: MCTP I3C driver

 .../devicetree/bindings/i3c/i3c.yaml          |   6 +
 drivers/i3c/master.c                          |  35 +
 drivers/net/mctp/Kconfig                      |   9 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-i3c.c                   | 777 ++++++++++++++++++
 include/linux/i3c/master.h                    |  11 +
 6 files changed, 839 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
