Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637EBC35FF6
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 05:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hh+SUf829uT0cjZhjCJGiZ8xvBt72RNNPYOt19l0wl0=; b=LEQww2rjoVPBSH
	rUqeLIWLlrM92xM69GviZPIaI8s99/RH5a9BpAMg3EBMdbD+pG4zqf5zC5vc2Ftk42AL+T34aoXfj
	UoRRlYltoZgbguQuHEOEBDCiopBxChQPWlWR6xbDDWTpJW+Mk173jOxyanwmmy1MrQDC/J/fmrItQ
	Jg9OvATmli2Z2UIuEnPoDGQHVM2g1tVr9mFHUP5ogy/yXMEstwY6E92MlGoQNfLcjJgTDgTw0f+V4
	7N0BvI5yoUq/bTx7ghzXES7fesF5/Y4GU+6KP8+j3c+ELC3yjfjLPG6/jWPNwRfuPxlXyfoGNDohu
	a8z2gMyMamB5vftnTHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tP-00000001G70-0Lbn;
	Mon, 17 Mar 2025 05:20:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu2tM-00000001G5q-2mh8
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 05:20:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-225e3002dffso33005865ad.1
        for <linux-i3c@lists.infradead.org>; Sun, 16 Mar 2025 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742188800; x=1742793600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hHpeaAz642MIL/iezdA9kA+qz/7ACYSpLAAklsJNG0=;
        b=DUReHNw/f8ZUgWy2FPA3Qk3BFUAKOV/6Io/G0kQwY7y2KelfbjLkC8SQzexNDTZHmT
         m9DgRf27z9JgyQVj8495CzNqsU2tREueMoHbLY+dusxZHaWeQYOjJxZv9dIFu66C09Ex
         M4nXo69+zHoRNYju9bGrwC6sFk/f0CoGsLmH0PJrsoaLFrHE8FSZ61ha+kSi7LLv3q2Z
         6fb7QJa3xkIVgY7zNwG0SJRNGbeqgkCvidYC8MJKOOF94UWfVSpNNei95yap+WzxCWgR
         M1tYbweqG3JH2lhQ6Rqdd4uq0U5aGQrfC7PFFf3CvNf1vshc99e/zhzY1loA0slo9xTX
         uG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742188800; x=1742793600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hHpeaAz642MIL/iezdA9kA+qz/7ACYSpLAAklsJNG0=;
        b=qpm3cS212QEeViFCQS+YjQn8h051aMIZdsohN0625RDvdr4x+2SPXTElG/BSO7Lp74
         mR3JgdcCeVTGXJngslEv5SWFEfd1cgzZcFosG9GQsGogPiqdeGJO2ovwa1V0FkocMq16
         iVRZ15O81JtbOol58sqHi67PGOnxMJN6OJMr/gxPnPP4f867YXcSRbgee+lxpeXUBq5d
         cFz/5nC8OLqMUUHVjS+hZW00CvcJU0VfX3OwOawNJBbLct981Q+gMuL71Pf0dt5SvAIm
         6scYR99C6JjNbWgfvLuL0eAHF5cPHPowcEd6LWpnQHPMfgn4wlW6S4xK6vYJHToHVPnJ
         OxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoj3viYvwhBJCqXZlGl8z+WWcuCi4GD3Hm0hJm+RbEBsiHRFx3JKd46K10B9Pnrzb2p9/2KkQx/eU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyReVYE3Is+oUcsvDjLQ/O31oZmceZouWNpJ8Q17ZBww5tvu8i0
	28VrvpVNKvziH5kUfSpusx44X5esCukMWSpJicuibe2NvF5VDGZnCnxTaAbb
X-Gm-Gg: ASbGncseXJMiT059RSYPz4XVhb8mSKd5M9PTvhZtzJdCosU9aV7ekyb9THWFneqbW3u
	7bC26m6KQ2AEhy25G0HH8pcRkOaw0ILsemrBkDuMcEd1dib44d6t8onqHBfvg7gB8PlIm6GDI5r
	etd6DmWFO5B5Gt5SggVVOlqsKJgSS1Y3ZTudtko4RZGF8yRVPsQwC+00E0FDvG/XFj+43SSp9F2
	jVS9KYhC6Stfdu224X/YcFydQIsSohjcRfEKxu0+3VsbEsmtCW7PUnFouOYLlmiXMFpWcfhZBLA
	1orY6ZNqrEKdXQ8I3XtzD/yjKYcAiI14QoLlblOFJiJ6ThY0IEH1Dlz3uKlw7x+isQ==
X-Google-Smtp-Source: AGHT+IEV6Wz5E1OsOPUft0kE2VrP4XoFNpoRQ5PM0M1BZxRJlTEp2VRWJHVmkulPVIEYr2uaQc1eAg==
X-Received: by 2002:a17:902:ce8f:b0:220:c63b:d93c with SMTP id d9443c01a7336-225e0b07523mr139991475ad.44.1742188799683;
        Sun, 16 Mar 2025 22:19:59 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:df04:8817:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba721esm66029975ad.149.2025.03.16.22.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 22:19:59 -0700 (PDT)
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
Subject: [PATCH v1 1/3] i3c: master: svc: Fix missing the IBI rules
Date: Mon, 17 Mar 2025 13:19:49 +0800
Message-Id: <20250317051951.3065011-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317051951.3065011-1-yschu@nuvoton.com>
References: <20250317051951.3065011-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_222000_714917_D4E62275 
X-CRM114-Status: GOOD (  11.27  )
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
However, some target devices, such as secondary controller, also have
the controller capability.
Modify the code to add rules for devices capable of sending IBI requests.

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
