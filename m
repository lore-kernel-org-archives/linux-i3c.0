Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5755AC10F16
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R9lMO0RmpPzSppD0IuOCo1Wy3dBi2LGXpXYQO8JkrUU=; b=smH3eD1enzZC8k
	6jhPZA+rq/4YNtoIsZ4wajs3TrQCTRQLoCSuyNnXISMETBNjIeS29u7lRaUynQrejdgFWhlFh5gmD
	AyneY1WcW1U13uGL1ma8QgyromLArz+wc6OiiOVr13ZFCk5rLJu5TYAuQkCugCEMlpIhTuml9kfQZ
	sBWyHLGm5KrkiKE3yAzinytaWVqvdxzUxJ+Dq3//iU8wzT5UZREe6bmA70uXWMw3dcFIWHe66LMDR
	6MpWwQjuyPmZSJF8+kGr4MBijY2y5XlUT9HRZkigjBRLffe10d41HPZIwONC5XDlBDeCWkxUENy9E
	qOq2BKw3ZBOsSuxhv6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vwe-000000071cl-2TI5;
	Mon, 06 May 2024 10:51:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vwY-000000071Z9-3kSH;
	Mon, 06 May 2024 10:51:42 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 6 May
 2024 18:51:20 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 6 May 2024 18:51:20 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <jk@codeconstruct.com.au>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/2] [RFC] i3c: ast2600: Add MCTP-over-I3C support
Date: Mon, 6 May 2024 18:51:18 +0800
Message-ID: <20240506105120.3028083-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_035138_951775_67AB0C66 
X-CRM114-Status: UNSURE (   4.13  )
X-CRM114-Notice: Please train this message.
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

Add Aspeed AST2600 I3C controllers and add minimal changes to validate
the functionality for MCTP-over-I3C.

Dylan Hung (2):
  [RFC] ARM: dts: aspeed-g6: Add AST2600 I3Cs
  [RFC] i3c: ast2600: Validate AST2600 I3C for MCTP-over-I3C

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 137 +++++++
 drivers/i3c/master/ast2600-i3c-master.c | 137 +++++++
 drivers/i3c/master/dw-i3c-master.c      | 513 ++++++++++++++++++++----
 drivers/i3c/master/dw-i3c-master.h      |  12 +
 4 files changed, 718 insertions(+), 81 deletions(-)

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
