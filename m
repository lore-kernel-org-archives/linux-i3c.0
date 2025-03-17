Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B1C35FF3
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 05:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWSJG+ybhzl/gUqU9WXtyR8znGnj2DhwAMahSChaoq4=; b=27eL4kDAqEuUsD
	ctVXHEkHvEGBks+zlqiO5uBvm/sLJHg9JcyelwSXR85FS/inqzP/LPsTn8vFqGsfRPqsqF1xXAYcS
	x1Q1O1ujNuqyBXT5ZhZHs82OkrHag9t6t4OFgkGPCu/JVtXPINd9qT6HV4Y0IMonnsuUijogYOW6v
	az2yIgOKMU0KfGp995xCLNAf+wzvVgEu4v5N6kPXixXw9SR+CQnU3ny3U/qffhxH7k8S4tsuTyOIz
	0lUro+Xo24mCh62MxQigHXLT2RXabXB/6TlgHxGVWwNSKFm6ED+qiVEKkgi7PbQp2uhNtvukS/hM0
	Lcqbs2MFxXB1Zr8m9pBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tS-00000001G8a-2opa;
	Mon, 17 Mar 2025 05:20:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tQ-00000001G7a-3T2f
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 05:20:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2235189adaeso65345575ad.0
        for <linux-i3c@lists.infradead.org>; Sun, 16 Mar 2025 22:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742188804; x=1742793604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T18/LmksYiI2JDaALAx8F0tVbVplhY6o09bZJuKtckw=;
        b=keVVfH9QFRo9MR98uDMQPSgfAblDsjs90jOTQOX8zRvwF9ZXJblruMIJ4Sm/9ZL5wq
         9Q7pFRMX2nrjR5IH4YH4AG/syeb3e0Hq9NhuI2Z+m4zyTLdj16Eltg9Vgp/we1a+EmPS
         +QEkxcfuSz9y+7nkwjkl4ark9ffSvsS80KQN98yUwgh93NOuox81gWbxSdRUnL8VIU5N
         405UFFeKmpxuP+EAsgOZzQnYjPwphO2hcIJEDGAr8ALa2ew7IH3EpzvAfo5JxrXQ2IHf
         sLZ4EB5nDLDX73xGSnDgzdqSm+t945s23tywANPUYPlJARM4E5nRUtDKoU6msAgUvOSt
         ZXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742188804; x=1742793604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T18/LmksYiI2JDaALAx8F0tVbVplhY6o09bZJuKtckw=;
        b=IdHRQUcokYBlF1kaHiUb6qzrgvHZciKOCj8ZzNHALafvBnM4jueHMvYvU0UOtEfBPG
         bAir0FPY6wn76bOMwCntGE3zxuyeu3LrA8pRtvdXUnCELGX9gDHd++NE8iB532AMjy4v
         xIaVAzcw8IpkpTiHYsQmVQRdsVRE6Bhf7Eif/fX5mBleesyEerDcxMb+QrVM3LQfljbw
         oYOAQUqGi2R5ztuu3oamzzORwui3wdAR0SquaiGQ8yUxXL5i0wdiXbHuc/lWZKr2+hR2
         uYbzM2it3A/jBgwO6z0keRLfjOYRRgGc/glbG/dsKt4lYPnEjgf0wrRlIYXoyB6v3h7J
         UNmw==
X-Forwarded-Encrypted: i=1; AJvYcCXGfRs8ztyRbnfvBIPyXUydinE2OXu9dSt2akecWpqPt23taxPGqJH6VSuxYnvJur8EvY/+zbWkGC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCwrOBKIm+CFP6zLGFdA3XuL6i4HBKWWefXT4j8g6Hk+n+sybl
	UZNWdJiEPxuIupXQCiG2l91HWoXt3j45iBKHuAlheBwe+CLsdHrP
X-Gm-Gg: ASbGncs4MFwx28Ps4tmdKcwSWYoLZFggGN8u/DADAJz4u0/AZ3qqr/D9BnLIs3lmtWH
	+Dv2rtsDFFBoHqXVEcc4E1kHS/+FZ+7V+dvvFOJSFrGaY2O/vx9r7pLEarahTRJDUgdA67rDpW6
	P/EuyjaASRsy3UG/8k0FE8mErNBcmx7QjzgBbT+iwZDTVKCfwM6+tk4XyS/d6MAQBHLTmNpQY9N
	1ja/nheUsTDDaCqw8T08AIHX3zuM8U7EYoBGJcwNcVac7Cwq4NDstXFTKmmARtEo4/dVFwIRY8z
	YuSPTBxWYs8KQACFm8j9rObyzvvcq2VSCW85M1//2ZlLxE1oUXY8Cy0=
X-Google-Smtp-Source: AGHT+IFAseff1yIkZHzc1rGdhQPKl7uycYfsnTrI/GVu4JilKm2nddWrecFI4sABECPAMNZYRmECeA==
X-Received: by 2002:a17:903:41d0:b0:220:fe36:650c with SMTP id d9443c01a7336-225e1782e22mr164178955ad.23.1742188803960;
        Sun, 16 Mar 2025 22:20:03 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:df04:8817:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba721esm66029975ad.149.2025.03.16.22.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 22:20:03 -0700 (PDT)
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
Subject: [PATCH v1 3/3] i3c: master: svc: Fix missing STOP for master request
Date: Mon, 17 Mar 2025 13:19:51 +0800
Message-Id: <20250317051951.3065011-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317051951.3065011-1-yschu@nuvoton.com>
References: <20250317051951.3065011-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_222004_867668_6C8F9071 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Stanley Chu <yschu@nuvoton.com>

The controller driver nacked the master request but didn't emit a
STOP to end the transaction. The driver shall refuse the unsupported
requests and return the controller state to IDLE by emitting a STOP.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 57b9dec6b5a8..e0cd3ce28b7f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -592,6 +592,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 			queue_work(master->base.wq, &master->hj_work);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
+		svc_i3c_master_emit_stop(master);
 	default:
 		break;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
