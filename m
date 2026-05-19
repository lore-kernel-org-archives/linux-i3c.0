Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E505DCD4F3C
	for <linux-i3c@archiver.kernel.org>; Tue, 19 May 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4k+yG8FllVZARGyfiqGMbumfW5M20kNBlldmB7Usi4=; b=1C+LFeHSOJLHKH
	Io0e5mGWiqxGWOXA6QR1UPM91oBzQ267Xx0v3r9jYu7kvMXipTQWdUxAD9ThhvteWy/l8Uk7WJcVJ
	C4a2ianrcpcVUdgYVL0MUaqjtGG3+zrQIDmxMz+HLUV70xA7ZR9gFFabrsKlYfLy15wBwjXUMg8Tt
	DzN8oDEPWoq59roPfh5mvsjW0l6ANriatBs7Gw4CAzx9Qdp3M5Ehvz7bnLm+504uIyMVIx1lUNG+L
	Jk3B7tdvvZP0MFIqCiZxMT9FoB/weYwo5voXpJB1wqSAfN7DeO/KAzyzaV5FhWVu6U6tqht0Ti9xz
	O0M6cMvc65qdZnrKGt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDej-00000000HVs-2saJ;
	Tue, 19 May 2026 06:10:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDeh-00000000HUf-0sy2
	for linux-i3c@lists.infradead.org;
	Tue, 19 May 2026 06:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 669224458E;
	Tue, 19 May 2026 06:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F71DC2BCB3;
	Tue, 19 May 2026 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171012;
	bh=q6rby7Z/QurVEf6glmO1A+Aax63NyuzVjNDSoZEKwlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZlakL1TRjtjmwAPTsGC2Jrqq6V9vqNHo6bboiQh9aJgXjA+ETzrmpWG14ryyEjwfm
	 C6/ti4LXRp5HLsRiAldKYg3O5c1wCRScevLiTLcNMvq+YKPXnRp2o9at10mOxdgfcs
	 xfJBKOMEu/ojyywn1iXfxdrcnHdVy+nox9nz9+2QJLhULYv7JBmK321BBD7K32ydcx
	 bh9ph5rE5ZYSBDBVqgLJ9ntCDgMtcKmSV6jHmpk4JmB1nZNNQIbj5sNzB+2B8ypy7G
	 Ia8EqrSapZzDzvjUgWbbhnw2RZUM43Z/xJTqxOotYNVUc7XFm0tFy+dxuGl902aF4Y
	 12ggriEeDq8/A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Date: Tue, 19 May 2026 13:51:02 +0800
Message-ID: <20260519055105.13079-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519055105.13079-1-jszhang@kernel.org>
References: <20260519055105.13079-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231015_271524_32381497 
X-CRM114-Status: UNSURE (   9.91  )
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

It's redundant. This suffix has been in the code from day1, fortunately
there's no such dt property usage in all dw i3c users after grepping all
dts files, so we can remove it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..c4a848cc978a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		return PTR_ERR(master->pclk);
 
 	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										"core_rst");
+										"core");
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
