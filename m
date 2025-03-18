Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3F7C282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 05:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9m007aedgV1jJYJv/1CxXPTsB9kRLg5v2AukT7SOmM0=; b=l5UIVzPY8KH3FJ
	rn0MYa4weg9BLdtdmQVazGdPZsUn9kg/9sh/LHJmxV/iuCsm0QFKDFEqScnlk2gAID6CNxi7LqMMO
	mDVM/IlXo0rU3E/8pgpdA0hIhqurvbGdnSQZzZSynjbLGTtKFe6FRnFcRCdXUEIvdJOEsSnVHOqSn
	WQ6zwQwJ+EGzkEKZ/TBv6/gHgY7sgcHT3CSJiOmGn/qSKcTzh2PYB8sFIZpil/EZUYDFItSar3KPC
	Tb3Cto1vp3nmNH8u3VS9+v3Kg5sS41GM0suAcRvJluN9BFkKnCVYdjZyNONDTJONA9SpzYRZ2AeAo
	HrQmj/m3Au4ZVLbiypSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPd1-00000004j9y-0ond;
	Tue, 18 Mar 2025 05:36:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPcz-00000004j9B-1fLB
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 05:36:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224100e9a5cso99471385ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 17 Mar 2025 22:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276197; x=1742880997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAXz5zFV/dNZck8AAhHpDywdjolmlMduTc9D2SMrXCY=;
        b=lCF1UtiZn3fPGZz01R7gX7AuZO37pMUatK1UTEeLbygmNKc3+Nu4C83AveHtuW5jUp
         h9M2bOaWluBs9ix8nkbvvmRbMgzqF8tOQCeKHpj7ItYnWWa0z+v662swumKi+7r68hCu
         YNzzGE6REFE9sEVc9O/guY+c4ub1QN2hZfxZb9sAZSi+e4XhLKZ0EdjOn9IkfwVRa/+u
         kSA3DWy6vC3469EbWjQDZm3UywHmYFohAtV4UqrgnFaS/ExQdG6Zshaom2YL1PgOmobv
         yrf7LI7scSaQl0y6TENuvJkXFG3YQ4KmNIDokTA+v4/xFPcbVLwR4dBCdwFW6nv/M+gp
         iFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276197; x=1742880997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAXz5zFV/dNZck8AAhHpDywdjolmlMduTc9D2SMrXCY=;
        b=jhjbl1EBr+7MyUK3IM7hr4RJ1vQA8XnjMScOH9ft90ISDo11oSiGI2ejQ2sGEo60vh
         uOwymFnGOh1ZSYeds2Dz3lgPSCuuN7RBoQLW1LWa4nm33cKuPAImyifrdJ00aF/yY49j
         aHBG/WFF97AGhb1h7xgEE3mxPAgesABT/mytdv9iDrnlmAGKaw5gKNx8sweWnYwbW2RX
         cIaYwoKOraD8ntNSUI4y1joJM1VY27GtuDgMv1Qg1jC6ABGNkmt7SnKRdtsdptFgq61S
         RqSNNmnatYqFwIWiQZDIgCdZV3J87i7A4ZvJ6tmQebC92S5rhMgYUSo5S/duUZG79zW/
         EumA==
X-Forwarded-Encrypted: i=1; AJvYcCX05H1GFaEQSCpafVdvNWPLmp6ok7TZbAMYCHke+8ms9dYgL0dlaYz+4QpT622ACRtZzfFwyOP5MGg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDanLQ0EodDQkjxS281cRl5fNwCmz+3dND4Wad4UBil/fpmNie
	7sZkvppbLk4fz4Yskq7vfdIp4BYvMkk0EgMb+X3nJA4DUn9fOPRb21CkY1zr
X-Gm-Gg: ASbGncukOMctg702CdWNa8t4fco+RxhJaz1DJUGelmEjQm3NJz1qqZY77SAhYkGckGe
	dXRRBnoTenv4XLuR6lj7CQFwm/bEzO5R9cuKkmtWaz8eFZ97eSj3H4OU7ey+dPV08K4Urjuxq9x
	Lfp8nQBjM2YFxjMxGqhuh4KGjyF0COrfK1ldy8408x9slf/5m3rNHH3J7iRQPmYABK62d0Am/14
	KfxmOe4DsXAH/7/ta6nMO39y1Y7I01uctVZ/gEi/tNfbGnQG4+qNt1wSOypFGaM8n8BxnqrgjqO
	OAXOxywcchA4mA1oTBo1H2Q2yvPHzO+ZithkfVjjXFQWRUEjZ640JpQ=
X-Google-Smtp-Source: AGHT+IH8K71L41KaQuidRb124ubL5NH0GzYCl4FWRdtxSZGd+wGA+J5yLIlXt4vfeFTUswsRyFIAtg==
X-Received: by 2002:a17:902:ce8d:b0:224:721:ed9 with SMTP id d9443c01a7336-225e0b118ebmr195585385ad.44.1742276196636;
        Mon, 17 Mar 2025 22:36:36 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:dc02:2d2e:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f09sm85299905ad.133.2025.03.17.22.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:36:36 -0700 (PDT)
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
Subject: [PATCH v2 1/3] i3c: master: svc: Fix missing the IBI rules
Date: Tue, 18 Mar 2025 13:36:04 +0800
Message-Id: <20250318053606.3087121-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318053606.3087121-1-yschu@nuvoton.com>
References: <20250318053606.3087121-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_223637_434398_78D8E965 
X-CRM114-Status: GOOD (  12.09  )
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

From: Stanley Chu <yschu@nuvoton.com>

The code does not add IBI rules for devices with controller capability.
However, the secondary controller has the controller capability and works
at target mode when the device is probed. Therefore, add IBI rules for
such devices.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 1d1f351b9a85..a72ba5a7edd4 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1106,7 +1106,7 @@ static int svc_i3c_update_ibirules(struct svc_i3c_master *master)
 
 	/* Create the IBIRULES register for both cases */
 	i3c_bus_for_each_i3cdev(&master->base.bus, dev) {
-		if (I3C_BCR_DEVICE_ROLE(dev->info.bcr) == I3C_BCR_I3C_MASTER)
+		if (!(dev->info.bcr & I3C_BCR_IBI_REQ_CAP))
 			continue;
 
 		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD) {
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
