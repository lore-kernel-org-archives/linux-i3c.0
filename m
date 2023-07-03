Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FB1EB64DD
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ERhM+C2aczeULsJrHICDanLnKVgvq8nenmElwFBP1IY=; b=atDmWULE7X3vSp
	ECNAg22XwaKYfa8NP6WzKSm6v2PHVAZGDaUCTI0l0HITmG+P1Zo/PZZnVhkURRamj0wBzZ2OkuupY
	pdCRC4Flai933SyUA6vCPmkEO307xXqwgYjZJadTCqnTvKIYXNQwS6AEfeJ7x+oEpu9JpUMEKYfOn
	obgumKTgtsMgux0MxfhwVFcoywO1ghuGpdi/YmyOPSFsYF5xByZhDIsQIkUU+bXSxVNL9Y7eh9LDN
	ICjCHNHalDwCJpjju3efrXTMTn4OhV1yvCS8l70GBQ9hBLqyE25QVdwSYNwo1w7E+AKb1QXAMA8+1
	1ea8A7qb5vDBcrowtuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCAI-009LPw-34;
	Mon, 03 Jul 2023 05:31:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCAE-009LMm-08
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 05:31:55 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 5F8F020153; Mon,  3 Jul 2023 13:31:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1688362303;
	bh=LQt2kPJhGKAg0Y5UT/bfj8ZmQ8oXOQs1B872I/8uUKc=;
	h=From:To:Cc:Subject:Date;
	b=VvmvIMHiGxEiiGr+B4r3ldNNlIhw4iqbXiVtV+zal8xxkGXLZpd/Izuu12nv3L4qS
	 UGjsAs/+glhlB8D7DpzaE7sAwmZ+BanWZsK1ST+7iBr4GPg8IwtF6WkMTOIFsovpWw
	 zZR/QfhLZZHQVYHNV2mXxO4dqidLJKLNdLbdAD8zopvlrMbRwD30x0u1OmhZrnQlUA
	 vqJ5yS4AyrMA2x8WerPz8wEQRg95OJUBY5IYqyLfh0l+UMzzpfbTLYvDf+st+7esO0
	 f1qE9sVgijZ2yad4O+vqRwAa4aqQAqD94cCuSJXnUxb7rmLBwkA4tv3VEuiR7hDH/L
	 GoOJRAUs+qj+Q==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/3] I3C MCTP net driver
Date: Mon,  3 Jul 2023 13:30:45 +0800
Message-Id: <20230703053048.275709-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_223154_269829_BFF518F6 
X-CRM114-Status: GOOD (  11.57  )
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

---

I'll leave it to maintainers whether this should be merged through the
i3c or net tree.

Since my previous RFC email to the i3c list, this adds dt-bindings
and fixes a comment typo. 

Jeremy Kerr (1):
  i3c: Add support for bus enumeration & notification

Matt Johnston (2):
  dt-bindings: i3c: Add mctp-controller property
  mctp i3c: MCTP I3C driver

 .../devicetree/bindings/i3c/i3c.yaml          |   4 +
 drivers/i3c/master.c                          |  35 +
 drivers/net/mctp/Kconfig                      |   9 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-i3c.c                   | 778 ++++++++++++++++++
 include/linux/i3c/master.h                    |  11 +
 6 files changed, 838 insertions(+)
 create mode 100644 drivers/net/mctp/mctp-i3c.c

-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
