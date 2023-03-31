Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DACC76196
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1G2TnjRViQe7T1pt1+iUH/sNyjqEgJcfnN8q+whOAE=; b=ESFoBhZjbb62e1
	xxZ/qJi4cAeulgJeAovi68TmgE3zgn4+ur0ldvgVbPVGMOHc6M/z8FCl466nVylvV3aNH7ZDV3K3w
	feQGiiu85YyWA9APmci4YvZpGH1j4BE38K6dYJ4sAjBXzNEFiDxh9UbdJ03R3QCwqu7b5dSmLoIIR
	dKsGp+ONkOt1LXW+GjgRn3V/CyqMqbaNeQW7w08lmPqTyiizXsUIFgCMDWhKp2bvmei40KAMiq2EF
	OH8TbV2B6d4GFjSEAg7+/r96AAvXI0hYATWJeP9F6PXuDdxHqgplbveOvsZuvWuVl4Txk/W5erDqM
	kgT/wcQG4FMUsqVfy8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piArB-006dPy-25;
	Fri, 31 Mar 2023 09:15:37 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAr7-006dLv-2D
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 09:15:35 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id D189F20156; Fri, 31 Mar 2023 17:15:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254113;
	bh=V7VKEyDxEI8ZR8KoaP19Mi+G8YmO8XIsRnHDacm64Hk=;
	h=From:To:Cc:Subject:Date;
	b=f+RTY1E3vF89NURR2dU4/QVmDCdXUGRLzO8j9mEXZd2FHMuwn3dZm3VLen37zNR1g
	 Gfj/orZewDfOJot6Ge6C1NQCtHVqOdC8fEVf6wvLbvaQQLEyg9Z9U/taXOJ87mwGEN
	 iqen0pFTjKGb0Lz5g5fsttDWYln+XdOL84zGHWczsqjl/dMSmNiV6gPCa+roZoF2Dd
	 akelWg3oK+UjZOhc84dr55VOTRRSLsstLzn6tvA5ES5q/CGzhxo5LiDvkMeWRkkz11
	 z7WtyGMvy59CoX4dehEQ6QZ+OAinBDSfcFltX2gsvPxaEfoLvYpIosoXBuK35izM1F
	 tZzAVT7tR8yyA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
Date: Fri, 31 Mar 2023 17:14:58 +0800
Message-Id: <20230331091501.3800299-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_021533_916765_7970F42D 
X-CRM114-Status: GOOD (  14.26  )
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

This series adds a new i3c controller driver, for the ASPEED AST2600 i3c
SoC peripheral. This device is very similar to the dw i3c controller, so
we implement this by adding a little platform abstraction to the dw
driver, and then a platform implementation for ast2600.

For those testing at home: there's a couple of prereqs for getting this
running: we need the ast2600 i3c clocks in their proper configuration,
as implemented in:

  https://lore.kernel.org/all/20230302005834.13171-1-jk@codeconstruct.com.au/

- this series has been merged to clk-next, but has not hit Linus'
upstream yet. The series will still build fine without this.

You'll also want the dts definitions for the i3c controller and
pincontrol setup on the ast2600 platform. I have changes for those in my
dev/i3c branch:

  https://github.com/CodeConstruct/linux/commits/dev/i3c

- and will send those once we have the driver accepted.

v3: expand the prereqs & background above, and implement some feedback
from review. Mainly: rather that using a platform_data pointer, assume
platforms will use an encapsulating struct for their platform-specific
data

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
 drivers/i3c/master/ast2600-i3c-master.c       | 168 ++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c            |  76 ++++----
 drivers/i3c/master/dw-i3c-master.h            |  54 ++++++
 7 files changed, 358 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
