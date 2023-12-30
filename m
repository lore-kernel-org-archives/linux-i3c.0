Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E00C4706F
	for <linux-i3c@archiver.kernel.org>; Sun, 31 Dec 2023 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxV+myKGkQ2eklJXZA977gHzq0/0g8WA+ySvI/SNX9E=; b=ie1EQlazExK1iu
	iBlBDFk39NEU/ijEo00mpG0c6UqGzH/afYenA22U29PxUBt2uHe4NPIH9Jn+kROtzXywfLDpRwoAR
	nUs+oaB2VAc1n+gk1PYUpoXp9Le52j6M8/gjFgYglTBgfq3XRUAUhThdtNmMUSvVIxkG6dblBoOoq
	ETMgn9UYMbRG1VlleDMO0TB2U9yK4S9o0EgAvORTcMci94VCTJ/sccc0MHJo8zyJBojEQBZAUbZ0B
	h374Je+nkmUcXqZg6GEO21MN0hnBn9PTICovic9BbikW/OnoUX5iqEJngd6gsevn1DmBpYYRMNYUJ
	NBUZYNgIympNPDjytG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJzlZ-004vcl-1e;
	Sun, 31 Dec 2023 17:38:25 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJVNa-002Ru3-1P
	for linux-i3c@lists.infradead.org;
	Sat, 30 Dec 2023 09:11:40 +0000
Received: by mail-oi1-x242.google.com with SMTP id 5614622812f47-3bbebe6191bso667218b6e.3
        for <linux-i3c@lists.infradead.org>; Sat, 30 Dec 2023 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703927495; x=1704532295; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5u28Rp1tb71FYlh7pmJ9O9fHwq/HrI65yXbQ72B8Gc=;
        b=eFu++bud8lKfbagSeQl4UOch5c7wJa//pCeKQwavoID2RR2cUesX6X4fm7gypzq+us
         RTL7xWX1slpS1t9TH64oMvt4vTtz33g9VHt6csqv1dPo+qN19JMDyaVrEl6Hhv8hxQ0+
         8tKC5AwPn2ToDwV9tfj+eDbtSpX+hXXEd+S5JJnBh4Hysd4laqSk6qSWVegyFP+bXYsW
         g4usI6VKMkdjuEpeXmxMHsLra2A3JKwo/FAozhWvHvw2xlUoXFNwp3R5SxJz+CYkCVTq
         cEXabHYRZe0lZ+s6boBN4AlIeCLYyZZeg6/s1f/7K/cPuSH4Gy2+FrddUI/XxWZsVdaI
         IfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703927495; x=1704532295;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5u28Rp1tb71FYlh7pmJ9O9fHwq/HrI65yXbQ72B8Gc=;
        b=cnm3CA7INJI0+d4y37306WXYTkz/o3/Nbb0EWny9/+AXCcow3aUdiWsl2YnxAahvrP
         XAa6Trc8dC+v2cLFJw+cIRpmVwlgUXodwiSgQSpWKGEMd5WkOTYyQ3e5HQALdG/vxSmk
         xiy2UQyK7/EOwjgfyjOEMrtXQBU6i709lok7bmo5rcwV3539iOpzMgPadME/zJJgGjEQ
         gOLiXG7Z1/N6aPlTWuhAZL136tNMgDLR2NN2NPQ4sxkL6MtEO/oU54j8mUUuhFgjexzi
         W4AmdwENdaYft4StDvpQYTUqDYKiY7ZkyQgVbdfj3yPTR/GICcjZENrijbMslgSqJ6Oq
         AKmw==
X-Gm-Message-State: AOJu0Yyo0R+/Ff77fcoHethEdawgfW14RQ17YIjBGYj2Rj0k7/uq2xvL
	1stuXnbuy9UcDGBEKeA12QY=
X-Google-Smtp-Source: AGHT+IHLxNsKzyXqI+LKwAPn7SSSKMKNg3JpsILPAgWv2lynkK/hKwnTFNYhMy+ffvpiTQ+Q4F4cLQ==
X-Received: by 2002:a05:6808:23c4:b0:3bb:dcf8:eb00 with SMTP id bq4-20020a05680823c400b003bbdcf8eb00mr2990982oib.11.1703927495286;
        Sat, 30 Dec 2023 01:11:35 -0800 (PST)
Received: from Harshit-PC.hsd1.ca.comcast.net (c-24-130-71-249.hsd1.ca.comcast.net. [24.130.71.249])
        by smtp.gmail.com with ESMTPSA id t40-20020a056a0013a800b006da2aad58adsm4019507pfg.176.2023.12.30.01.11.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Dec 2023 01:11:34 -0800 (PST)
From: Harshit Shah <harshitshah.opendev@gmail.com>
To: pgaj@cadence.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Harshit Shah <harshitshah.opendev@gmail.com>
Subject: [PATCH] i3c: master: cdns: Update maximum prescaler value for i2c clock
Date: Sat, 30 Dec 2023 14:41:23 +0530
Message-Id: <1703927483-28682-1-git-send-email-harshitshah.opendev@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_011138_478986_59DFEA17 
X-CRM114-Status: GOOD (  10.22  )
X-Mailman-Approved-At: Sun, 31 Dec 2023 09:38:23 -0800
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

As per the Cadence IP document fixed the I2C clock divider value limit from
16 bits instead of 10 bits. Without this change setting up the I2C clock to
low frequencies will not work as the prescaler value might be greater than
10 bit number.

I3C clock divider value is 10 bits only. Updating the macro names for both.

Signed-off-by: Harshit Shah <harshitshah.opendev@gmail.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index bcbe8f9..c1627f3 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -76,7 +76,8 @@
 #define PRESCL_CTRL0			0x14
 #define PRESCL_CTRL0_I2C(x)		((x) << 16)
 #define PRESCL_CTRL0_I3C(x)		(x)
-#define PRESCL_CTRL0_MAX		GENMASK(9, 0)
+#define PRESCL_CTRL0_I3C_MAX		GENMASK(9, 0)
+#define PRESCL_CTRL0_I2C_MAX		GENMASK(15, 0)
 
 #define PRESCL_CTRL1			0x18
 #define PRESCL_CTRL1_PP_LOW_MASK	GENMASK(15, 8)
@@ -1233,7 +1234,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 		return -EINVAL;
 
 	pres = DIV_ROUND_UP(sysclk_rate, (bus->scl_rate.i3c * 4)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
+	if (pres > PRESCL_CTRL0_I3C_MAX)
 		return -ERANGE;
 
 	bus->scl_rate.i3c = sysclk_rate / ((pres + 1) * 4);
@@ -1246,7 +1247,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	max_i2cfreq = bus->scl_rate.i2c;
 
 	pres = (sysclk_rate / (max_i2cfreq * 5)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
+	if (pres > PRESCL_CTRL0_I2C_MAX)
 		return -ERANGE;
 
 	bus->scl_rate.i2c = sysclk_rate / ((pres + 1) * 5);
-- 
1.9.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
