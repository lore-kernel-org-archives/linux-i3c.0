Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91758C021AF
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0ubiloMCdvkaHJz7GSfJszS+YqRrVV7pxB9/kuZrYg=; b=OFhh7BMFrpzF3k
	kAHX+55OrutDo8MXGi12We84Z1XU0WYGWUEeOWmy/0RhT/1Dqyia9JhwKmxmm/8tZdS5uugLYdgJw
	2H1gI6CL2Lv1S7RBJV9NsyqR7AyZJQucOxuHDOtGECrGuBFO7YOVAgF4RMJ2QjzTrBiySTvxkfnXV
	51PuYVLgDDr+zWTsg1gaEUdYlsN+MSNjNp9G7748dS20npWNedH0toCk8aA2cuymewgjnvm/y+qtg
	nBFzyK5ieEmRT1mGJkLUn5Go1klcjzo1Jp0ID3waA7AfKCSZiSmj7ML5avTUE8XN2g38E0Zc85WZT
	5NTZRq5ilHT6fFRcXZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYcW-0000000AUjw-1PIO;
	Wed, 19 Feb 2025 01:11:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYbc-0000000AUTf-2chg
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 01:10:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-221206dbd7eso52735585ad.2
        for <linux-i3c@lists.infradead.org>; Tue, 18 Feb 2025 17:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739927428; x=1740532228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeVTXMfIDDovR3x4Ig+1s3A5xB2XDG1KMxZlkZxO9T8=;
        b=H4QazRtBTl3TgmWn0y5nhH9ctERPOTQJtzCDq/aBaor97dPn+RjQfdaRYtjIXlYseU
         A41zlD3TU3Uq01c9nroaauNVjhnamrZ7sMIWyeT1Z6JbU0J1Y3mRPv8Z6SmJq955i9wA
         S8ok/70U65LeF2pAsAziu3RrUleRb7MFAOKFeGFENHsi0BxwoMduXmeudIGRsGEG5M8W
         OD4AVNeg/IzfkOE9+4MfUHQP4suM73J0m/erqB/BWwU0PLElre19rLD1Ng4Lb4HrefX/
         Jm2jOVvx6jDw3qEzdFTpuE5Cx0DLe/zcjEuGMwEtmVCZzAQJ6INq45iP60D6Lnpt/sib
         R3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739927428; x=1740532228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeVTXMfIDDovR3x4Ig+1s3A5xB2XDG1KMxZlkZxO9T8=;
        b=WsFTP8iyfTgZqkf9+s/bE45G422dYYsfSwjqqwCtRXuqKuEP2GYmJ7J/Xz3sNtbIV/
         5loCA5xWUkJ72Mg/+biZBExayoMzXQGq0TwETU0bRAyZRfW6uU8pE92pNF3bDQKYrJV7
         jPh8fdsM00FztVqaVIqP0r6e+IW8gaISj6t6g7h5kxek80E//tqjeMlTOjndR6KbnnWZ
         7Vc6kLxj6yWbAA4eRbzWZLVXzOFUsrMOK5FEVYqCHdXpXzFd16ZCFKFNiwbr34rdvsxO
         QTp2YYVoWHzlyLlto9GtQnyHLOcPDwS7i5HqpWabV59n5iwpfklBLvHtaXdUlyL5BUJ0
         tOrg==
X-Forwarded-Encrypted: i=1; AJvYcCUwh/wz/j/yNsa61njXSaFnjg59v9QLzQVnNhQA7J96MdBrcDzCim/nfJ7HzDrGVO4NUiumoHVqGMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyPj8QaV6xYVkuXXkhaQkS2/JqVTOe/QyghbEzxM3Wm0y09Rbc
	hTHmN6vz3LcmWkAUu0CXMpK9ewhW33RcxITbLejn/SEeOfWUnOGsaJluaB9Y
X-Gm-Gg: ASbGncsfqqn8JVNysKPQR2ZFb2E5fGIXVS7Ayg6S4Z+RQOSwmKPShEysBXGEXsaCWDd
	phI/RTBxght1moJE/5wo95B0y8rcZQ1neNTm8bGIsctfe06Ov9gE+483vzRn6jsEr7LRUk1CGxY
	9BOr486qMOTkTXpcpCbZhj0zVqcOw/5vSJx1OtRoWLpjMWBWJUGlyG8c6HN1Z/g7gF+thrkKFQ1
	RaNidmrVSyc9gMSDJVUfFllqunT58PIPn0lE0OcyJjmUrvjR/+oUlYSzRq5EHWdTU0triqnnZCX
	BtdpNeiL/goABtV9obrGBCakyA==
X-Google-Smtp-Source: AGHT+IGEy3Kh6gL34D+bhWUQUiTH6OPIOsHN0rcxloy4L6e99McE1rH+dwDpAVZD6Ph9M3ku+CTBzQ==
X-Received: by 2002:a17:903:2f8d:b0:21f:85af:4bbf with SMTP id d9443c01a7336-22170968d0amr22211755ad.20.1739927427950;
        Tue, 18 Feb 2025 17:10:27 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f05sm96080315ad.2.2025.02.18.17.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 17:10:27 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 1/3] i3c: master: svc: add support for Nuvoton npcm845 i3c
Date: Wed, 19 Feb 2025 09:10:17 +0800
Message-Id: <20250219011019.1600058-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219011019.1600058-1-yschu@nuvoton.com>
References: <20250219011019.1600058-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_171028_665046_38352D92 
X-CRM114-Status: GOOD (  10.01  )
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

Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
Add a new comptaible string to distinguish between different
hardware versions.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..813839498b2b 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1960,6 +1960,7 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
 	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "nuvoton,npcm845-i3c" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
