Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861F7C021B3
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 06:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe3jPDPqK6opmwMQMxpHGomFZT16aLxdfJp6ozNunOk=; b=REnn4WtwSGYO07
	KcczHQuHRumopxDJ1W9ouKEeyTvblkVcUySCgrFyn1dBV8HcEGfYx2MSr01EQym0vHjQIgaAyHdGY
	IcUyFdX4OXkZt/0Pdg+GEBya9rScQbZEFsfuK3vvbZJB7eqHobcOBFbnln1ZN151k8KYQB2Dzd2O0
	O035pLqNGUlqKM7d6pVcr8cAdgJcUbAarT4q2F+pG1TsBEU+zkGpJEukZWEESV1kdL54ChUjAgaBN
	cn+Nx3+JDwBmV1oJo7S6gm2sDSEBo6344qf/jdX5uvMIsuGrkrb+jMakLUhgTdmiMwUbpaasxLzFv
	pDmoGt1qVZdfv2F+heSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzne-0000000Gtka-1Hxq;
	Thu, 20 Feb 2025 06:12:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzmN-0000000GtQ8-3oxa
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 06:11:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220d39a5627so7825735ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031883; x=1740636683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxPtDSmF5toWDiVEva1QGdhBkil/x42rbDTCJ7UnPbk=;
        b=fG4qp0TU87t+UMekFPEhvTtixi2iBvxAzFTphprmjwbGsPf3ZfpS5z7xI2hWdSy4+N
         bvDjKzQHVMDwLfvnbPvwV6xmwzfYMK6xgA8XofOs4e48msmQdO3SeMzOzr8QM+rE0OXH
         nLrqzHbE7HI6AbpPCLWDVzTibYpQlw+n4w03+aJreWoMS6voSFkkcVO2JmflidBnmhy8
         KBriMXjopB9jofOPqX9uVeQuTCeus8Xzi+lHfU9Ge7uK06SCMgScVjrMUNEIurP/Ae2n
         mqyLuSY0nJfjcS6B3bMA2TMmDTwes42W3hSHUa+yGx+4nV7PnMqLbzUHgE+t5v3u+H5S
         a4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031883; x=1740636683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxPtDSmF5toWDiVEva1QGdhBkil/x42rbDTCJ7UnPbk=;
        b=OI/Nh7r3KIvCdMX9Z3aPOw4Jhi4kfClV8nybmrt0BeEo1PT7juyBdcql60jgLoI4hU
         ceyYB778I36mU5IFeM21xbMZ4RkSlDNRzTaPtxiE1wIF/4uK3yZkjZlDT2OyjTubtuIR
         SIOZhMe2tRTkgu6XDBIMS+mVgZc6HbYYG0zaQzmuwLM9ijfUf1Snk0L7v6MGFbJGOHG8
         sqZrJM5mo1Q5rTnoB0TtKqtUfGYCTEC0ch2JiZtc297GowJMrYi4I5yG2VjkJXdpxq+5
         At2zaCls2jIV+iDruNfI6T4d1gSZDwBJTqVCsXWMtuJrWB022TompH9OpuCuw7eprpD3
         yssA==
X-Forwarded-Encrypted: i=1; AJvYcCUS2xNiZkjDkXVGDa0kAjjU3xbZXzKx0P5zZC7hSrjievxnyAu2wMxYwL5CmkiO+SQ2fRvR0zmg+n8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAQTdR2obIV41kXTR4/bQpiWGEHXJkXvBXzMz7r6J9WdCiYsGz
	U4oOc8CfhNdS1e2IiWSYGzRwkQQ2paLXEvf/d/iHtk0QlYAwoJho
X-Gm-Gg: ASbGnctdOSu52+FD8EH/nurPceAvpl38FqDCzuqUNQfQ1hd86vIo9ANfu9rEpR3F3tQ
	sGOYkI8sL7JQRiSUhWUzYj0ay8nq5F71XtBBlae+/0GdOL3PQFpUEGJOveF4MgdO9kxlzF1ck7Q
	moggYx8XpiWlKEFklZnxAEtpkL2qctKTmzYbey6oC+CXdZuRHvfNsRVE9eWRb+1AvnUoMHQ5yeO
	YTPPDPr8zcSAbXmG9HuMbuXvAH5SK3U+Oi3+ZpehsO2fyoJOxtx1b4CMNvfdc75Hx0GHoVH8jK7
	YBGBDYUJX+NVrE8OhTpm04FezA==
X-Google-Smtp-Source: AGHT+IEAbZsipXfJW+8zXBKzNEmPmaeBGZCutp5H7G84Z/naDOUlLTeWukt0d3jIBgxqJG5RWZh0VQ==
X-Received: by 2002:a05:6a00:17a3:b0:730:9659:ff4b with SMTP id d2e1a72fcca58-7341734f098mr2122693b3a.19.1740031882957;
        Wed, 19 Feb 2025 22:11:22 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271a02648sm8226823b3a.107.2025.02.19.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:11:22 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH RESEND v2 4/4] i3c: master: svc: Fix npcm845 invalid slvstart event
Date: Thu, 20 Feb 2025 14:11:07 +0800
Message-Id: <20250220061107.1718239-5-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220061107.1718239-1-yschu@nuvoton.com>
References: <20250220061107.1718239-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_221123_968484_29C3DD07 
X-CRM114-Status: GOOD (  11.09  )
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

I3C HW may generate an invalid SlvStart event when emitting a STOP.
If it is a true SlvStart, the MSTATUS state should be SLVREQ. Check
the MSTATUS state to ignore the false event.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 2140da3f5187..5861358eb9e5 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -58,6 +58,7 @@
 #define SVC_I3C_MSTATUS      0x088
 #define   SVC_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
 #define   SVC_I3C_MSTATUS_STATE_DAA(x) (SVC_I3C_MSTATUS_STATE(x) == 5)
+#define   SVC_I3C_MSTATUS_STATE_SLVREQ(x) (SVC_I3C_MSTATUS_STATE(x) == 1)
 #define   SVC_I3C_MSTATUS_STATE_IDLE(x) (SVC_I3C_MSTATUS_STATE(x) == 0)
 #define   SVC_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
 #define   SVC_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
@@ -589,6 +590,11 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	/* Clear the interrupt status */
 	writel(SVC_I3C_MINT_SLVSTART, master->regs + SVC_I3C_MSTATUS);
 
+	/* Ignore the false event */
+	if ((master->quirks & SVC_I3C_QUIRK_FALSE_SLVSTART) &&
+	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
+		return IRQ_HANDLED;
+
 	svc_i3c_master_disable_interrupts(master);
 
 	/* Handle the interrupt in a non atomic context */
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
