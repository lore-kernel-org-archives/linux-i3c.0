Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FCCA0EFC
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQhni/bNaeBbciZdBfOCvaNojSNu6jbfubSRkgjWbyw=; b=BSBSNSyPfUSSlb
	6vJJV9gCyHoM7QCIzb/NmbSSd4P7jb+TyBTYUtsqHN2buFPLGods3LHjybRYa7BGtxR0GMhIWR3Eq
	VT2kqEDVIUpJQsoSy3F2+nWiTc7cfuD3foSQfYV4/nIg9p7HIdKVBsK71p3eBZbqD6bqMdoktzBb/
	+C4LwKIGOSnaQ2APTtg6Zl2EwXBvov4uRdm/c0DKCtAvrw8vrYgYGTVhEABOWJFHjpe3ypRwYrZKt
	BecRAEMASdMaj0/Zrt5t0pYbscDHJ4rFrm+ozw9uRnCtZ9hjzkEIbJosxtYuj9u9/BPea8+0FKCJA
	avzwdiiCr52NKUaqd9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIqy-0000000A0Ir-3dJf;
	Tue, 19 Aug 2025 09:42:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIKd-00000009th2-0Mz0
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 09:08:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24457f3edd4so36093045ad.0
        for <linux-i3c@lists.infradead.org>; Tue, 19 Aug 2025 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755594518; x=1756199318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IM574u9BvfLwspshaKYvYoAzraPVyBpTcdO8NtZkO9I=;
        b=LbpLWqIBvMxvzZZBiua6XmdqcMR1GAZtfErieIGNN8KSeblkV9qZwrDrnfjdMpT4qH
         oLVO71U/GRPj1VZGj5+68rFCWJeo5dC7G5Tt+V3gS1zq2dt9rIxa6/X+Rstew773H+RT
         zmjaB6bIj9b3RLLmj6nmy+zBwiKfqYX1q7izmzljc0I52PJxY40JMoZnVZWcjMmZd8iN
         Z8iPYFjRuZg4NpH6ik8NRZHbRD7m26HdKdquetS43pIVuBzAe+8qjlHWSb6aAeCoM1GB
         Ayge6+DyG5Othw1ZNGq8CY/pREwi5DllCoMECNmj5JLZ/N5RJ5GRxDAXsT+0VBr1FU7J
         UhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594518; x=1756199318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM574u9BvfLwspshaKYvYoAzraPVyBpTcdO8NtZkO9I=;
        b=nvG3WfxpU+j47H4BM3RcvFr56DeeQ/CfXEHKKX3t8wlb+VFHQ0Iy7qaYE53aOSACB6
         lRo+Aa8TFGuhFtpL80KkP9Ayf+xlwrY/MuZ2ui/HV/glY4pWBstPilmad6UMb9dHiX9V
         +yZehY9fD5t/K5b/JUYxU/EW86IxSxcvU8gohfn3dBGsaxObbpyD1FEuxuFCaL0u6EgP
         Z0xhYezo/iJiWRKESPhaku/NBseIJiuzfUuSpB0ozf0wW7Qsro5oBu+IybAg0jTnpWTV
         Sqtq8gGhFu37wSH0LH5m+EjyYNi23EEQHXHK72rosjwYHuOgiwc+d+Tlnei6YDgfuOjR
         CURQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQG1oy7SDb21liaAAH8SwQyhSKBS3MtxTvdKxBHaYqde1w98L5wDaNPEyGGmftMRPR4x2l+tiSEws=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1TVthl48OJBFpDMNuc51t+uKUZZu6AR0AJcOu4D65YfXFy8Gk
	PVP3XejGBJxn9mxJ3nyi81/XJuGArjf4b5S4/jvAX1O82ATzmq7lh+ca
X-Gm-Gg: ASbGncugOolDyMySkTVinfipl7+phCho/xsGrgr/HIaiCbNiwKpaje4ZL0smTb4zuBL
	dQLDG7kwMyU+3DIIwmMaJqePXorG4DZlnZcjTzIryFeAfroPUOCvpEJr79wBStrvIoPRFo3EB9j
	LtzIx5ATBsTlIYEkG7uu1Jt1W1CUw6nYFaBpdH5lAJeb5t+NN1RW5JAIHXPU9Mr9OGmxkD6JhyZ
	Ka6HbHGf/VGE+SG3I45V1rZZGmxVWkPtx+KMIsN9a795NnDysYjMgNk8s2ZZviHCJ40ZZ9GBK5P
	jOG1h7yFNn638WN1yR0tMjrdOSkGbTo3IdNDpepKAJCzlTDg5i+nbFQoHYw9B2GAK1Axvpor2Ce
	6jpFMDrHmZlSV6CbkcVgyNqHKvrcp598k
X-Google-Smtp-Source: AGHT+IFbouRjVkiLIRAKmdNpxoLTYyac7gzUT26rM+4XmksL6F3pg/OvHMPzXf0ODtZEXmE13gk4kQ==
X-Received: by 2002:a17:903:291:b0:240:96a:b812 with SMTP id d9443c01a7336-245e04b6fdcmr25057385ad.24.1755594518003;
        Tue, 19 Aug 2025 02:08:38 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5536c3sm102693555ad.137.2025.08.19.02.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:08:37 -0700 (PDT)
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
Subject: [PATCH v1] i3c: master: svc: Use manual response for IBI events
Date: Tue, 19 Aug 2025 17:08:31 +0800
Message-Id: <20250819090831.3009647-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020839_132040_4936B278 
X-CRM114-Status: GOOD (  14.22  )
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

Using IBIRESP_AUTO causes the hardware to ACK IBI requests even when the
target is not in the device list. The svc_i3c_master_nack_ibi() has no
effect in such case.

AutoIBI has another issue that the controller doesn't quit AutoIBI state
after an IBIWON polling timeout. The following sequence is the case:
1. Target pulls SDA low
2. SLVSTART interrupt triggers the IBI ISR
3. Target releases SDA
4. Driver writes AutoIBI request to MCTRL
5. SDA is high, so AutoIBI process does not start
6. IBIWON polling times out
7. Controller state is AutoIBI and doesn't accept EmitStop request

Emitting broadcast address with IBIRESP_MANUAL avoids both issues.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 701ae165b25b..17644e041b44 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -517,9 +517,10 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	 */
 	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
 
-	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
-	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
-	       SVC_I3C_MCTRL_IBIRESP_AUTO,
+	/* Emit broadcast address for arbitration */
+	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
+	       SVC_I3C_MCTRL_IBIRESP_MANUAL |
+	       SVC_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR),
 	       master->regs + SVC_I3C_MCTRL);
 
 	/* Wait for IBIWON, should take approximately 100us */
@@ -539,10 +540,15 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 	switch (ibitype) {
 	case SVC_I3C_MSTATUS_IBITYPE_IBI:
 		dev = svc_i3c_master_dev_from_addr(master, ibiaddr);
-		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI))
+		if (!dev || !is_events_enabled(master, SVC_I3C_EVENT_IBI)) {
 			svc_i3c_master_nack_ibi(master);
-		else
+		} else {
+			if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
+				svc_i3c_master_ack_ibi(master, true);
+			else
+				svc_i3c_master_ack_ibi(master, false);
 			svc_i3c_master_handle_ibi(master, dev);
+		}
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
 		if (is_events_enabled(master, SVC_I3C_EVENT_HOTJOIN))
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
