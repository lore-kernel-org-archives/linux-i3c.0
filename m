Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC8BC41513
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Aug 2023 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XdxvTwfASnJ/Jw7GMXgai05ZCt+qudGZoMp6KyiZ9YU=; b=GuDAHCk3iTVmQG
	T4Oyu4TwY7d+9GrTtOQdafrXqMyamTadTpi3lVCGGOzna/UoZTzPlBrK/m4Tn6a/4m9kl4tDXqQPv
	DBGi/AMptvMaWSO6NCrCL3sDUGE7DqRaKV5lpSVRhCZwCXczsVo6wq9fzmpEw5r8kDRhcGA6fRX3a
	pbZPeKGAWt2tFMfKXl/Vw+Ke29zKSJkGin9Eyv1t0O9iwwfFThA3k3UYRcX9TM60eKRZDThbphD8h
	2NH7OGI8JMvI5p4TS8ajWnyvkqhmNPnmW5snP0bEfjfRoV7qQBShIWzIRcuQrKWIhj8FhRUL3xsY0
	2ScyGnL7zxYQTce2JkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrlR-005znX-2Q;
	Wed, 09 Aug 2023 22:34:49 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOrB-002pVn-0G;
	Tue, 08 Aug 2023 15:42:52 +0000
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Aug
 2023 23:42:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Aug 2023 23:42:44 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <alexandre.belloni@bootlin.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<p.zabel@pengutronix.de>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>, <kobedylan@gmail.com>
Subject: [PATCH 0/3] Add Aspeed AST2600 I3C support
Date: Tue, 8 Aug 2023 23:42:38 +0800
Message-ID: <20230808154241.749641-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: Fail (TWMBX02.aspeed.com: domain of dylan_hung@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_084249_133773_6BBB62FA 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 09 Aug 2023 15:34:49 -0700
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

This patch series introduces the necessary changes to enable I3C support
for the Aspeed AST2600 I3C controller. Specifically, it addresses the
missing pinctrl configuration and reset control for the I3C
functionality.

Dylan Hung (3):
  ARM: dts: pinctrl-aspeed-g6: Add I3C1 and I3C2 control pins
  dt-bindings: i3c: ast2600: Add resets and reset-names
  i3c: ast2600: Add reset deassertion for global registers

 .../devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml  | 12 ++++++++++--
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi      | 10 ++++++++++
 drivers/i3c/master/ast2600-i3c-master.c              |  9 +++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
