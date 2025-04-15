Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332ECC369B8
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Apr 2025 05:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMuEG6ZD02/9q//vWhwn//bxoQXvq9WLjWkhPv//gHo=; b=Yu/Xenp7aOS8h+
	7lKURmENADhR84jKZta5kcpyI0C8fd4XIZq2zeEAKnUPlD3ech/KjeFmvC5txyK88DRhixZqbeCtB
	JJkN2eF2hDBFHuV7WNPBkaeJIgQQEq+RtPB/H6dKm1YZ9aSUC2uc7ZNfcbRY+nJnkoqjSEIlqInBu
	hlnex3dGmMJ/AlBpopjkuWZJWY1SDoghC28j5ddymtLlPjceTXC2NdneI7qQ86VGdlOKTfukSo/Ec
	GyKLPomr7Zt2JA6Uq4wmpzoAzTnpnQoNz1xaqG4J+0+9CqF3f/3N4JqNp2tHb0jwW6WErNKb9ZtP4
	jQess/fhG7jn+V+UnlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YuB-00000004Yud-423v;
	Tue, 15 Apr 2025 05:32:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ygl-00000004XBr-0Z2f
	for linux-i3c@lists.infradead.org;
	Tue, 15 Apr 2025 05:18:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227aaa82fafso40354365ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694306; x=1745299106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI76QAcxqNzjywFLS0qo0pBVDITySnFHR3quT+EiiHU=;
        b=McXUbHV1DaN1ODyU6IRS+BE2zv9ltf+8x28NGwL0mPqmFilhegJv5/H5cJHd2CjeJt
         UliVNtPLCdtSe4PKyZtZWTyTl/YeoOGNDUZRV1VX0SIlMvLkkt/dcV1WsEb0nNc4qnnJ
         VnbK2/gYbOzHyy7onpPASor8ntpIfK7Vw9VtLUFWrJCJuVKoegUyyo+BlCfHA783P4FB
         pPdsmg63/e8iSC/PEiyyRRsRsxaWsWsl6XeQ7zBNtki/rqh5TC6eenY9DiKNlbo+OeXb
         jrDl0/hKXEgXGNhpVkl6oI9TVYDiNKRPlWKJexeZX3D7icJynsCA4OgaZjIGOr6pGuYH
         rQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694306; x=1745299106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vI76QAcxqNzjywFLS0qo0pBVDITySnFHR3quT+EiiHU=;
        b=jeaR6S2ZmODp5Zz65zgaI36+6brID5MjIksyUmTXK46mjmNM7168x9GrrYW/umBcls
         JV2CJVNaZaJ4mOCLaCtWUzH+KNfJEnnIuGgkNllABMAEfJNwzexdR5nGfcF4aoCEIj4a
         IlfxOi9opCCLzLbW9M94dwWsH2S/NFmntnNIim6XbOub1ah8vwLBjdIhkMaPt28E7scS
         1QBPbFg5FJd9FC1oyTVjL90Pzpg00knMjslUheKnRp5B6+9CqT1mj6xkzyAr+g0GH8Oe
         K2WaG+dq1fcMT74NTxddvmr5QKUBGZLrSZg4kdejvXdbZAMtIDAbDWNIEZX8PobT2AL0
         YChA==
X-Forwarded-Encrypted: i=1; AJvYcCVQpPQd7lpR0Ysm3GyX/hpoCumiwdLpllRo7DfY9cFFb13nz88jC03E/Ktp2GYpXTcMmwzt4BN6h4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX/wExszabJvqTCSkBgOcq9eJ+b8w2F6o14qYr9jEA6vNbkKGr
	8HUJ7mVqwPbD415GuDzJy57K8tRi0hfNbBdfaCvskMQHGG6qY/yF
X-Gm-Gg: ASbGncvdtSJ0UJUHrOaqAL5b9alnYnKgisKKgMGqFSgwxVOAlE2kBOErKqENSLqSHjl
	QkpihUBJYYggbirJ5WBdw5vozUCnYeWpF784RsoEQeKRJ+QCIQxsk7eqiRjK4EZGbyKUIZBdpXI
	MgBpRJQ+WE+fcRjse/ASDwhrHQdWn1Ie5xRTQb1iG1OAGcl9zXpll1CDEJtQhoXd8PAQuYtgTWP
	g3h5QmVL88pui65cQzGlfyWQTh9H6Do5e35nGio5yk0RtdZ9Z8R204vv8O53VgczHpz4vSORId1
	UFAJX3/+Fm7wDjZBY6LuiU+B7vEPePadBPz35b3fdd8GLDYi95c=
X-Google-Smtp-Source: AGHT+IHmzWyny0cRPPo46EzSAicI+hvTsIHybybAfvZel9Sp0MwXpEYdkTjuqOPptMMvCHcUx+yUJA==
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr240245735ad.28.1744694306193;
        Mon, 14 Apr 2025 22:18:26 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:25 -0700 (PDT)
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
Subject: [PATCH v1 2/2] i3c: master: svc: Emit STOP asap in the IBI transaction
Date: Tue, 15 Apr 2025 13:18:08 +0800
Message-Id: <20250415051808.88091-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221827_172668_795849CC 
X-CRM114-Status: GOOD (  10.88  )
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

Queuing the IBI request does not need to be done earlier than emitting
the STOP. Emitting STOP immediately after receiving the IBI request can
complete the IBI transaction earlier and return the bus to idle.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7ceaf3ec45bb..9b23239ad8db 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -577,11 +577,11 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	/* Handle the non critical tasks */
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
+		svc_i3c_master_emit_stop(master);
 		if (dev) {
 			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
 			master->ibi.tbq_slot = NULL;
 		}
-		svc_i3c_master_emit_stop(master);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		svc_i3c_master_emit_stop(master);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
