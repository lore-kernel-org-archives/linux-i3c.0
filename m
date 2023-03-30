Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24502C761AF
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 07:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=magYm9CG0oMcQESfs3b3+jvvknTWfl/UdXxNsZrcqMc=; b=UXMCg3JMb2RrGB
	LAjovu1mL5OqyMht5k2W3ZzinKFB/cbSNGY0Glz0j7lHz2R2MymZQWhbJIgkgoJpPXcUAgg557nx0
	YFEkCBejC+5mfwOgo0H+twpFZiHCSVJ0lHpABzYIH6V8khqOm3S01Ejm4JYlk1LDrpxW3Ep0oDPBs
	ainpjeXhwECshzvGZ+UcankOY4Tyg8Wjl+2pcuWO4598xkjONpBxbcYHZPse0AuItIq6pMCIn/VnB
	hud3s96dF9ZOiIzCEQ++EZ4hSGL2628o0vnq9LZ5U8//0kHQetHTtZ1MocHfN8XZ2jhdBDk3Ptyb6
	j7UzimJD2qcwWUcLaCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmhh-002tZp-1W;
	Thu, 30 Mar 2023 07:28:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmcI-002szX-0V
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:22:39 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 01FA82009F; Thu, 30 Mar 2023 15:22:30 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680160951;
	bh=HI0L+z4dSuwtyWV2p3iTINZNDNpoWtJAQs+xUxWefHs=;
	h=From:To:Cc:Subject:Date;
	b=IizepTBbjfn9pu/qH+Bg9rbM1qPme6TbRW/0RFyiZ+8Y4U4w8/I8qc2g1LotCNk64
	 MJnFICkXinWiHNyW8oJ0IJWiVL3hP9uB1nMEICc9k5X8DGRBphpTTdMFHMi3FiNMwT
	 ffSTh5fE9hlklFiC9Aofd4Zmv8clY4+j5jNPxRqVKqgiOubt6ebFQ6iX+eO5JJm+PH
	 lUdm9UJOEcx5e+1uG/zq6UtMdux18eh39YTwd80oUnWqdX4+QyT1yr9svSZ3rGZAsz
	 EfzQnW9uYQm1CYswzRn6QF3fQUd1urlCi7UQAR2qUYlM/8/wPskL6lNj+yaQMlJxW+
	 lUkBjOAfyIU/g==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
Date: Thu, 30 Mar 2023 15:22:16 +0800
Message-Id: <cover.1680160851.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_002238_408526_1FE82261 
X-CRM114-Status: GOOD (  10.34  )
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:28:12 -0700
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

This series adds a new i3c controller driver, for the ASPEED AST2600 13c
SoC peripheral. This device is very similar to the dw i3c controller, so
we implement this by adding a little platform abstraction to the dw
driver, and then a platform implementation for ast2600.

v2: This is a rework from an earlier series that implemented this as
part of the dw driver; I have adopted Ben Dooks' suggestion to split
into a new driver + exported hooks from the dw base.

As always: comments, queries etc. are most welcome.

Cheers,


Jeremy

Jeremy Kerr (3):
  i3c: dw: Add infrastructure for platform-specific implementations
  dt-bindings: i3c: Add AST2600 i3c controller
  i3c: ast2600: Add AST2600 platform-specific driver

 .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  72 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/i3c/master/Kconfig                    |  14 ++
 drivers/i3c/master/Makefile                   |   1 +
 drivers/i3c/master/ast2600-i3c-master.c       | 169 ++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c            |  76 ++++----
 drivers/i3c/master/dw-i3c-master.h            |  55 ++++++
 7 files changed, 360 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
