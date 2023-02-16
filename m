Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D64C636D7
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cXZYkx1c1S6Hojpu3jQX4vLShnZwLyIfhnRgVNzYmlk=; b=mZ6YtLdEyaQBUd
	cQnsnY6MykWESRuhLRY1KNvtYBe+FTRd+dPrqOjfbzrtliczFGcGdELOlRIKYFUmcyupNE3pFqEq0
	xquQ8xCDsdRfmHEVSHXtygYVm/lp3UnPbcBW8HFfxwSaTp6iZXRstahBLdqQqai8cW3SrdcYOJgQO
	w7w9DGCbaEB04qCBjUkdFbt5mjRxTVHfVaAX+XSNlQSNPcm8FN5NQS4JgPD0hZoXsiiZyLLPoZrh7
	w6aeSjcOyF9rigt931UCHhK8/UznZ7wimsjZVP1gsti2FXmxH+VjvPSxkyAvTC+NkS4HxjkWValON
	L5z/ekthjj3BCKMt2SiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7M-0099IM-Lj; Thu, 16 Feb 2023 08:59:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYu8-008q9c-9w
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 07:42:09 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 35D4D200E3; Thu, 16 Feb 2023 15:42:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533320;
	bh=4WNgPVjHnkyd+O8qT3n0+qVAMObFFFxGFkSm7gNIyyc=;
	h=From:To:Cc:Subject:Date;
	b=KSe9yqoyHL6hKI3XVVLn+TrKbxor3hAZuifCG1iXSrz7es7wQGnt+jzQtDV1zBJBS
	 nQ4o14z7Qp1Cud/UoYhKe6vyhkSUNLVxl/2OrkSl1TVMEVGqy4daaJfyd/2R3tJs8d
	 p3LfCXsqDbHT8fRnwBWAIkH/HyiSmpAZh2k/2doQtiqCaF1C80bT8SOY45T7MeBzxK
	 DqOJHpe4hGrve7dXH3zpOBAF74KBWt/mMvrtb75OrjrJQZceKTlzNQfqvWvULD1KCL
	 kcunY8cORDGx7DYNihRmVZC5PbnHGAK6aidU9aAicWQp2Irs8jfavEJg0zTp3qMFgM
	 Ohbvs0FGmK/3Q==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vitor Soares <ivitro@gmail.com>,
	linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] i3c: Add support for ast2600 i3c controller
Date: Thu, 16 Feb 2023 15:41:51 +0800
Message-Id: <cover.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_234208_560027_908DA057 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 16 Feb 2023 00:59:51 -0800
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

The AST2600 SoC hardware includes a set of i3c controllers, based on the
designware i3c core, plus some global registers for SoC integration.

This series adds support for these i3c controllers, through the existing
dw i3c master controller driver, by adding a set of platform-specific
hooks to handle the global register configuration. This also gives us a
way to add any future hardware-specific behaviours.

We also need a DT binding to describe the ast2600-specific hardware.
Since this involves new (mandatory) properties, I have added this as a
separate binding rather than add a new compat string to the dw binding.

The dt-binding example depends on a prior submission to the dt binding
headers:

  https://lore.kernel.org/linux-devicetree/cover.1676294433.git.jk@codeconstruct.com.au/

Full support for the global regmap will land with this queued mfd change:

  https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=cf2271843de835839e91c5c036492a87085af756

Of course, any queries/comments/etc are most welcome.

Cheers,


Jeremy

Jeremy Kerr (4):
  dt-bindings: i3c: Add AST2600 i3c controller
  i3c: dw: Add platform operations
  i3c: dw: Add AST2600 platform ops
  i3c: dw: Add compatible string for ASPEED AST2600 BMC platform

 .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  73 ++++++++
 drivers/i3c/master/dw-i3c-master.c            | 165 +++++++++++++++++-
 2 files changed, 232 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
