Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7192FC636CC
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHkZyTXsqH6aN5c+D4wzS4eSGwfQPpy/ytQHwV5aIYQ=; b=tMi4+d+Atk5d9/
	HXCzuXQSWDzmxDRrcHpPeNqA6+N2gEW48a2uEgLE2fFSnbSmMEcFLEHO9pMmHkXoC5+YMOT9XCwH3
	GD86cmt7mZt1ReZwiLyk/1q0u86UT0aRrMqyjNkCUAH+gUkADE2NEQjrJZuSPmh+1mIOHu7jCIU2U
	3Q1kCcuhfWOu02AdmBqhXhb/t+Ggzr7MtJjPEJTFw3RcqVlAxQQztQ3i1Yo1bSHRR4chKNkFWMsTN
	YPcxyvK0+eE9VY3+3RilnoeMD+PReJPNd9dZPdcuwr1rO0ak29DFH9AfgbSHZ1dnmmc7geSrywCSB
	vp/OjatKVVk4qIP3ZXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7M-0099IR-Pq; Thu, 16 Feb 2023 08:59:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYu8-008q9Y-9z
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 07:42:10 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 294F9202BB; Thu, 16 Feb 2023 15:42:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533322;
	bh=WryB2GO2zbrBH8W+AuZGRUy0IPCfawW4rexCATxsMBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eEytakf3bWKJmEVJAsaqrNdZ4Yrkak1X/toUToOL/S3SqugAS2GUyL4iSuDNq/x94
	 ZRWUanKtpochL1PbTtn78MvlZxxMX59bsowwH5jjoMG+dEu00Iq0cFpzK+bMmxhKt6
	 P9mO2HzWrRRVyMdpNS/hhKrH5AzFapkgKUEew6wDO2MW+svjKBhPSH+cChFZPL9wNg
	 13t6mgcYwSe8qpqjL7CIgEqrZxCXWGl98/J3NuusTKbzmX9JRCt89+8mQAvsLInAEu
	 dsEdEOmVHwVlAeTkoOxtU2S+NDdLOo6kg2VmiUxXf/b4W3JLq9cVHKLm2RVpi8QtFQ
	 k86uz5pgQJRwA==
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
Subject: [PATCH 4/4] i3c: dw: Add compatible string for ASPEED AST2600 BMC platform
Date: Thu, 16 Feb 2023 15:41:55 +0800
Message-Id: <90e8fd66b42bc27e6b8c01085c40721232217a5d.1676532146.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_234208_596482_D44E5E8E 
X-CRM114-Status: UNSURE (   7.99  )
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

Now that we have platform-specific code for the ast2600, enable it
through a new compatible string.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9be3348cba0e..5ac226e0c558 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1269,6 +1269,7 @@ static const struct dw_i3c_platform_ops ast2600_platform_ops = {
 
 static const struct of_device_id dw_i3c_master_of_match[] = {
 	{ .compatible = "snps,dw-i3c-master-1.00a", },
+	{ .compatible = "aspeed,ast2600-i3c", .data = &ast2600_platform_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
