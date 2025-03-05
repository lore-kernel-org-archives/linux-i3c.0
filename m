Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0147C19F32
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Mar 2025 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKYHxyJkW7B1ze7XOkTdOZmh0uMEdVuySDNAui0Nfo4=; b=l+D7bhJaF9hfg2
	HtudYo0F36l4//Pn8DpMZQvWkNlm6Rm19Jpc1mRFBEcuJDdF7lsrSah6v1nmk27htlBEwUjZ65FP+
	CiivmOAaitOYtrqkCNpgPhCE4RvMR7PidX0v2XPB/dJRiVDeMTY72uWvjJj4JDS3GrovdJ3SyZY5s
	m0rB0kc7JFTjHO1sacMSW9ipBKnEUEnQd/XIjz9pkX14TQvmWIYMwze4cZm1i5dKze9atfH/dq84C
	2KJxRBri7467Bphmi96gittePkFQzJpFwWaCxGzDghU/0ZKfq+udWBbvsm14N0dea9PpOJEVfyblm
	vPmUMv1fzEg1A2Wp4iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphnM-000000074l0-2IFd;
	Wed, 05 Mar 2025 05:59:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgf-00000006tzm-1j0o
	for linux-i3c@bombadil.infradead.org;
	Wed, 05 Mar 2025 03:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VxSorQjSMBJHTcXavhQOvOimi4+hQN1XV3dQDpeZRl4=; b=pxwOv3sbrkzLGDRfJXM8RQ7aQX
	xyPpMRodAew4ohnraAVbWaA5IwA/l8wCyWRKLqObfAZwk9Hb1mwwe1hZzeG8t6xbY7+DzxqkeVRuQ
	lJU5+JCTZJLlU3q3xNl+mcf3IlwXenWz02VtPP29bkjtuPJAsgfOo0BTnQw6caBByQGk1XvgImTzq
	q68QMNELsjyls+cf8rsnyEp/QiOGBMNos73ZZ7Hysf9Hm3Be8RJcWgPX3cnvu1BvWoAE0zwwUYzFN
	IZkXKCqha81qSOLAxUo38+QbiC6lHTw9or7x0K9TJ1ZAHma/yq07IaPSfIwJp/TJMZ7PUtlWdgmc5
	qZ5qv2GQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfgb-00000000LVA-2FuN
	for linux-i3c@lists.infradead.org;
	Wed, 05 Mar 2025 03:44:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22398e09e39so59646735ad.3
        for <linux-i3c@lists.infradead.org>; Tue, 04 Mar 2025 19:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741146283; x=1741751083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxSorQjSMBJHTcXavhQOvOimi4+hQN1XV3dQDpeZRl4=;
        b=bmofAbf4EYMNoqSdKJKZRdeKN/4JwXSg58nXkR6eJN6fJe2f9BSIJ9UpORRz7GRW/S
         jnQ0OzTgb66JuI6gWCGEzxLcC6pcwWHKyV3bWdFz+FF61MtdThGOEHuTeAnRDU7+wcPM
         hAPoU4ttbl6Qxb91ukcM/TuoVhf1WRGfWom5IKWBzQ1+XcF2AxqYEUC7n5oH54Xe7kJo
         rg5/9tvhCPjXyisFk6La96iosLJFakF+TZv9RHsMCFMl/Cat1rV2GfDy6XUk6rm2QS+3
         FUVXlZC0Cd1vkPM7ceE2MiifD2F1HKNX/LDqEr89y1FVtjeaz+eg8N/kjswVvBxy9mpv
         nl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146283; x=1741751083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxSorQjSMBJHTcXavhQOvOimi4+hQN1XV3dQDpeZRl4=;
        b=gtOKM5da+nCPsAYyQ6W4wGqN5J4dRoQ7dxkoW3PWCcI+q1l7zcxVNxpUex3wYKL+E0
         ImbFDO4A4lL6sfVHf3tWmEyCrzdWmiG0JDcK06dkZODwTokUUqgvH1YBQIQvgpbeD96y
         rs5kG3xd1EawZlJWPesNtmg5B/zsXs+JVtqZX1gZ4XkJ2ujvuoZgsnawRpukGb27RbAp
         tylNP/BBZf2Oa38ONXEhooB2U4mVsHzJxk46aJNto4V58XESkF5zPW8jLzcTOBjWNKEK
         k6zsapfcs8Qkem1tEdmpy6179YO30MbKk+mgHtOqrdE1R3I/gbSAEMt814be+mIrD2UG
         9vdg==
X-Forwarded-Encrypted: i=1; AJvYcCVt3f2hqJnO3hGmoNHCIrTUFO8IHIJty4eP5N7WVPFqamG9mEOTqOSVVikVZT1VmxDHZGKHeQq8Lbo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+YhtFJxtlv7kVQXKXHl+aindEsptSsYMuy0/HKJ18AXbvJMXC
	TfYQ0UDVgAb4pkYuCTC3tBwe9IZ4zDZQqeNlwsaHZVwFoVFDUi/g
X-Gm-Gg: ASbGncttwDcrYOqpUIwgIiVhOuDz0AGkdvaQjMI6e4y7JSOuUY8S+gyj6dj1h4+OVqq
	gOdQUfnOAE+Dkwnb5hhulvdmNJDszm9h1KLpdY/hT4unhwwvLsjYVSGrkb+TJiJXhjQ9MQFVkUG
	xSAE5hTuzvlrMkO4jKZ1DFd/xMgSFgGC9KJO/V+9JKNDurfUo9fEqhLbGoebdOmH0TpaMyQ+oau
	yhbS9gcn1reZZc34SQ8DzCS8DqwBYEmsyZ1chmRK38ADg8GDhdxLYVl+coFixlNOKKZIPAkjPlL
	ynvKklYbTW1KcxbRWanuhtqtfLrRvTcGAxXGl36g70rnWHlCRrUQoAI=
X-Google-Smtp-Source: AGHT+IEN4FhUYURRgYRRhgTu3XPVnsiW8vehuNjd+QA5rMsT8ISHbmnMzH5qpu1A6/3fHjlDi0Nr1w==
X-Received: by 2002:a17:902:ec90:b0:21f:4c65:6290 with SMTP id d9443c01a7336-223f1c7d39emr24886825ad.1.1741146282851;
        Tue, 04 Mar 2025 19:44:42 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:d305:9d26:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c37sm102734335ad.133.2025.03.04.19.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 19:44:42 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v6 2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Wed,  5 Mar 2025 11:44:11 +0800
Message-Id: <20250305034414.2246870-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305034414.2246870-1-yschu@nuvoton.com>
References: <20250305034414.2246870-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_034445_748566_6A74BE33 
X-CRM114-Status: GOOD (  13.28  )
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

Nuvoton npcm845 SoC uses an older IP version, which has specific
hardware issues that need to be addressed with a different compatible
string.

Add driver data for different compatible strings to define platform
specific quirks.
Add compatible string for npcm845 to define its own driver data.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec..7cafdc8fd1ad 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -158,6 +158,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -183,6 +187,7 @@ struct svc_i3c_regs_save {
  * @ibi.tbq_slot: To be queued IBI slot
  * @ibi.lock: IBI lock
  * @lock: Transfer lock, protect between IBI work thread and callbacks from master
+ * @drvdata: Driver data
  * @enabled_events: Bit masks for enable events (IBI, HotJoin).
  * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
  */
@@ -214,6 +219,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -1817,6 +1823,10 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
+	master->drvdata = of_device_get_match_data(dev);
+	if (!master->drvdata)
+		return -EINVAL;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
@@ -1958,8 +1968,13 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 			   svc_i3c_runtime_resume, NULL)
 };
 
+const struct svc_i3c_drvdata npcm845_drvdata = {};
+
+const struct svc_i3c_drvdata svc_default_drvdata = {};
+
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
-	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "nuvoton,npcm845-i3c", .data = &npcm845_drvdata },
+	{ .compatible = "silvaco,i3c-master-v1", .data = &svc_default_drvdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
