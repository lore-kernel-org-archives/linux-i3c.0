Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE229F5A8CA
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 01:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TEyxTNGAMLW6AiOXiZaTuQYcSt3F3XGFvSgWN1sQpdo=; b=NAitrjrmVdlBq9
	jn/32eiN0VnVUjZZ30tCQC+5v0gupj6DqVKLivj2tALCydALpdyVqVp8nF8sf57sN06f3HQu5trTp
	Ig+ejtZ4maVjSC3/i8/nv9x65ZNh7ZQVgl8Rw0ty2Anu1N7+GpEDIgKNXe5qaIJQWwIXcpQ1dq0ve
	D3BqM0VnfUCJzM+3AepazagU9xcQE4PmM6+bFAT4jRiAQ7Wk6/YQ956nr5rSFHKFzZdgkIIJTdvrt
	9x/KxoC5SMObigegejM95O2/k/Wx62CHZF/RmQRCeudeuxVAg0MHNlnIpvdncM9uJKaVt7CTFXfhF
	04qMF+e1tCtiE3S7uXqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzdf-00000007tB1-0oTa;
	Tue, 21 Apr 2026 01:10:55 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzdd-00000007tAh-1Jwe
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 01:10:54 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-479d68a9062so762911b6e.1
        for <linux-i3c@lists.infradead.org>; Mon, 20 Apr 2026 18:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776733851; x=1777338651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6UNueZCYaVxV9NTuR5KCCVe4O4ODh3xoZKmGq8PGYU=;
        b=PfjuPRowpkwl3cYZvV51HrVyTN3AXpKXYu1Ia/Jm2tvECR8rJeECrjRlekkVdkGBjG
         yshA24ZAqOszBts+ghl5if0iSS0wRInytW2+3N1o0BxRMESswE0ce7Xhd8Ssa1TW35te
         GzSlfLsPb+zHDfQVhFegmeP5IQWrXES2oYAV8XORzbZgfB28a5IPfVs589/l/7DymHmd
         QiKi6126YiEQnVAfK7JpEfiBBKyRuZQ6SgIna/vML5/KCqv3bxfZA0hEvYlI9M48Dx9D
         5r1syEDtLEO5TCWUsfMA3pc/eiRXpAQElgfSHQ59eiy9n/WcJMBG5AQUBGVavLra/I9l
         4iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776733851; x=1777338651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6UNueZCYaVxV9NTuR5KCCVe4O4ODh3xoZKmGq8PGYU=;
        b=fm3guZwqgndbxmfYqj/J/nPk0sIuNDhURskXC12IbNrzn7D3qdRKwahoYS4KXefCwN
         OS+YxqxX+DPwYJCOpUpI4LRjVg926NkmWs1OR9msXB3DcviN7KmLBWLlnOqeYDN52XVw
         V0tyzN/2R3xh+f0AgBQrXJix3x4TRQEW0/z6kBc0j75m6NBlfMgqZfn4M90mb9QFaDLC
         HhaOns7LaB1X5ldvV2edZrc5Bsc8QYwsYqd7jhS5P2Z3pMcbQ205ASkuP35AchM8OE/c
         rLAc/oIBH1LXsGNvTXrWQvyWdBf/xSbBd5cM4XKYu/1+hdGWPJizE8sFNp5Rm4rr4AHt
         eTaA==
X-Forwarded-Encrypted: i=1; AFNElJ/Llq+5MtI3MZLvbJ1agHnbSBWB9qTIR8jKZJTo8q2hOKk0Zq7Q3WtP/dGJrISatSRCBUOYLtUtONI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoPfW3ouRhxovU2VE9x24eOkiJz541nKa3f+4yxklabjD8AwQk
	LSwtjkxAPeJI30S/00bLfz65bqIABi05oTKkrjWlxF9qq2atqglWEXXigZog6w==
X-Gm-Gg: AeBDievuLWh8t4tR4BYY7kcfafHLR/zEeQPxZqQ5s5NL0pWBFfZTSR5qLfyPOMUCGr8
	K9fu3rEU1afj9PNERD4qdDA4fnt5pVhWQf2QJ5yXsAWxdtmeLm2u0tmVaof+Qgv36U8AoTRF/qO
	muZ5wyxRzQIJIhOTgwHi4Q1qKlhYUwZTVSYRn6DqZzOQqahqqfXomPq9JOII7CN8tz9y3D3bS6T
	o9BHvNOI50o3hnMQAq6CwLHmdvJqcGUIyzREx15KRhNVOSOFYHokPlfQVVO+YcWtv/yjCs0XSfZ
	GjZX8xS6Exv173Qv2jjalC5RuMKGgjz7vTit8fIN9iNEpJQANtrVDY9o/jW+/u6AhtQkeYyfmLT
	gWH4ZbgUk6DpyTPDVK5+VNtAYYWJJmLFHo3MzaL3BMo61sCT2V8pW4fupPppEVEHuLbY9UwxkZm
	CwiKgwBMS/LUHr2xph5Gl1W6nMCYgUEyuvjiIand63C9rsYfdAj2TYZAv8+jCMEO6SBdoo
X-Received: by 2002:a05:6808:22a1:b0:479:ed26:fbd5 with SMTP id 5614622812f47-479ed271b6dmr664393b6e.21.1776733851454;
        Mon, 20 Apr 2026 18:10:51 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcc892c515sm2909613a34.21.2026.04.20.18.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 18:10:50 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: replace sprintf() with sysfs_emit() and sysfs_emit_at()
Date: Mon, 20 Apr 2026 20:10:49 -0500
Message-ID: <20260421011049.63899-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_181053_366207_5CB90AA4 
X-CRM114-Status: UNSURE (   9.77  )
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

This patch replaces sprintf() function calls with sysfs_emit() and
sysfs_emit_at() function calls where appropriate. While the current code
is functional, this patch will help harden the driver and help modernize
it. While at it, this patch also adds missing newlines at the end of
some sysfs_emit() (formerly sprintf()) calls.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/i3c/master.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..c0d19eae06b9 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -174,7 +174,7 @@ static ssize_t bcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "0x%02x\n", desc->info.bcr);
+	ret = sysfs_emit(buf, "0x%02x\n", desc->info.bcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -191,7 +191,7 @@ static ssize_t dcr_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "0x%02x\n", desc->info.dcr);
+	ret = sysfs_emit(buf, "0x%02x\n", desc->info.dcr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -208,7 +208,7 @@ static ssize_t pid_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%llx\n", desc->info.pid);
+	ret = sysfs_emit(buf, "%llx\n", desc->info.pid);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -225,7 +225,7 @@ static ssize_t dynamic_address_show(struct device *dev,
 
 	i3c_bus_normaluse_lock(bus);
 	desc = dev_to_i3cdesc(dev);
-	ret = sprintf(buf, "%02x\n", desc->info.dyn_addr);
+	ret = sysfs_emit(buf, "%02x\n", desc->info.dyn_addr);
 	i3c_bus_normaluse_unlock(bus);
 
 	return ret;
@@ -256,7 +256,7 @@ static ssize_t hdrcap_show(struct device *dev,
 		if (!hdrcap_strings[mode])
 			continue;
 
-		ret = sprintf(buf + offset, offset ? " %s" : "%s",
+		ret = sysfs_emit_at(buf, offset, offset ? " %s" : "%s",
 			      hdrcap_strings[mode]);
 		if (ret < 0)
 			goto out;
@@ -264,7 +264,7 @@ static ssize_t hdrcap_show(struct device *dev,
 		offset += ret;
 	}
 
-	ret = sprintf(buf + offset, "\n");
+	ret = sysfs_emit_at(buf, offset, "\n");
 	if (ret < 0)
 		goto out;
 
@@ -290,10 +290,10 @@ static ssize_t modalias_show(struct device *dev,
 	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
 
 	if (I3C_PID_RND_LOWER_32BITS(devinfo.pid))
-		return sprintf(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
+		return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04X\n", devinfo.dcr,
 			       manuf);
 
-	return sprintf(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
+	return sysfs_emit(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X\n",
 		       devinfo.dcr, manuf, part, ext);
 }
 static DEVICE_ATTR_RO(modalias);
@@ -578,9 +578,9 @@ static ssize_t mode_show(struct device *dev,
 	if (i3cbus->mode < 0 ||
 	    i3cbus->mode >= ARRAY_SIZE(i3c_bus_mode_strings) ||
 	    !i3c_bus_mode_strings[i3cbus->mode])
-		ret = sprintf(buf, "unknown\n");
+		ret = sysfs_emit(buf, "unknown\n");
 	else
-		ret = sprintf(buf, "%s\n", i3c_bus_mode_strings[i3cbus->mode]);
+		ret = sysfs_emit(buf, "%s\n", i3c_bus_mode_strings[i3cbus->mode]);
 	i3c_bus_normaluse_unlock(i3cbus);
 
 	return ret;
@@ -595,7 +595,7 @@ static ssize_t current_master_show(struct device *dev,
 	ssize_t ret;
 
 	i3c_bus_normaluse_lock(i3cbus);
-	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
+	ret = sysfs_emit(buf, "%d-%llx\n", i3cbus->id,
 		      i3cbus->cur_master->info.pid);
 	i3c_bus_normaluse_unlock(i3cbus);
 
@@ -611,7 +611,7 @@ static ssize_t i3c_scl_frequency_show(struct device *dev,
 	ssize_t ret;
 
 	i3c_bus_normaluse_lock(i3cbus);
-	ret = sprintf(buf, "%ld\n", i3cbus->scl_rate.i3c);
+	ret = sysfs_emit(buf, "%ld\n", i3cbus->scl_rate.i3c);
 	i3c_bus_normaluse_unlock(i3cbus);
 
 	return ret;
@@ -626,7 +626,7 @@ static ssize_t i2c_scl_frequency_show(struct device *dev,
 	ssize_t ret;
 
 	i3c_bus_normaluse_lock(i3cbus);
-	ret = sprintf(buf, "%ld\n", i3cbus->scl_rate.i2c);
+	ret = sysfs_emit(buf, "%ld\n", i3cbus->scl_rate.i2c);
 	i3c_bus_normaluse_unlock(i3cbus);
 
 	return ret;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
