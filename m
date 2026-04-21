Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CEDF94CB3
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rk5w0SRkCjykgQz5ctHtzDkQ17q1Ls0Ow5WwQzK/2Rs=; b=IB90IfC4uXjf7d
	eSssz2eI6zNnyQxzipfX732uj8J3Lqk9T6J6TcXtQXGEkWPq0CU1SwJh/rblQreE1e+KRe5J9vTRx
	qr3ABPwpzNJp5tYc+nzlHejhelBaJCi4JrpDO+xEXIRYX31RAPi7YeNj3e87iHc9p/+rzSRFQpiD6
	mm+87OilxcwlDfxF7XmPZmHvYsmuUW0dvkHV9kKr1Wh/3jiRTQTKTSMHVCAHMjIV4+eoORmPiMm32
	+IaKmZ569pZJHkGN9CY0Rtoaxbmc82Kt0Cck7ITNsfjh560h2Ob2REjLWpza2R3+8iQsXPvLtd3/s
	0u/Ds+MYl36aexIhtMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIxW-00000009D6M-3rXW;
	Tue, 21 Apr 2026 21:48:42 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIxU-00000009D5W-2GIB
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 21:48:41 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4670676ba03so1300775b6e.1
        for <linux-i3c@lists.infradead.org>; Tue, 21 Apr 2026 14:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776808119; x=1777412919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaoP4pyVSjCeA6bwsLDEugQYLQyHAyT99gzHjryd6F4=;
        b=NsjQON5WLPbkPvwbIt9/piHEMqdwmSCU3dCtG4E/o7dfIdzMpR/ELuMMxHC4Yui2tD
         x7yN9Ik8yT+3LfvZRG/FILyF5jpf2y7tPBp2OowEnUzsfh+DTq3qSjpmp2xRPC+lOKk6
         C3qcaOYYgwWujeH7mlBNSjZNZoabClp53lJT2sDYBUctcn7B3kGVz5sn9nsWXY78slKZ
         or4ciWrh69PMgyGoAbxwKa+giUbBm84UTf8MtfmYzpYpzaLxqg/DTskYK74bRwrcuhb5
         FYoWColCXWIvWN6uR7Meycgx2MKGuqze/yP7/2v/vec8wYLohur3IuXwc8oeJDJYfIWm
         ZD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776808119; x=1777412919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaoP4pyVSjCeA6bwsLDEugQYLQyHAyT99gzHjryd6F4=;
        b=reycP1t1uIv5wNhBdZkXD6TGPwX8Fq58l+t9CziXL/YOhhTrslNeIi/f8fiqjrA50f
         UzGuOLhHefQXCyEf52+57FJO1GoHoeWEAIY3QC3+2zSMfcHnoQmjHYgp9+fqrIGGGFK6
         1eY8TfVqQbe4XjmInX4RjNddycMM8z+cIOdOHYanMyTcQZ8rcbGyvwLiwuAdDZdHdUYm
         8xNqEdHZpnDopKbD0pHl9k/EBcG/Iuty/j/8lyK2eFvlUBHDCMUffVKP8LCdLi1FIT5j
         xkARsm9tItBD1zl6jUI2PONVox2z72rwkIsQJmX0Ag5vkysudlc/qGqMisM6VYTb377O
         Vh7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+nLOSH0wZr9S6UXJlSdOqGF+/kdv39tpyYvKtwNouhMWej1aiSpmWApkLPi0XAJSD5qJO8bHKpc5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUc84JK+XpP5cx4STsFfTTHYLq7F7tfZEMdWcyAcAu8y3eC9m5
	mQvws3o7SGX6IB+mlFNrExHGi0kHnI1cSHqVvECH+V6UuiV4Z7A43yme
X-Gm-Gg: AeBDievgEtqxstRVevLm1yewvitcq5k9wNwZyp/G2wIAkSYObt1amiJZfmxEycaS2tc
	5Y/ALsQBKLD4M5QlS5oMfnTnTdXOJi0UHrWPK24ezSmahbKbSsa/4QT0+bWAbLsvirWooxW4MCB
	rmTeYXj4xWgyS90e7mExu5I49dQR+hMqmsbYixq7ADhdFAefKivgOGbV/igC+FBF/UPTmgofpf6
	eS2VOE1XGtqQUi1kL3fV9CR2IiPTCeUcziiqdza0LmKMms32yctXhkaHt5PQYQ6z44U3Vq1/5Tq
	iQt4G8KTxD/nL59zz62AgLHAUtwufDux95HvZpkRNHNKXTaunBd7UyV97X9Fv6RXzjb87pDMR6d
	uNu0TnTwCLcaYCpNctcvD4uFC/oiFH2l1mLIKy6d/mcTmEYcs+Uyqg+6tvp2mS7N0W4yClLeuME
	oU9yqnK0NjFk9cQOidKzh7UXw9vBN5mwqDZT+3P14eAAJPi/LHptBLnQdyWdHXksU/XdNW
X-Received: by 2002:a05:6808:bc6:b0:45f:8be:d983 with SMTP id 5614622812f47-4799c8ca7c3mr11827919b6e.12.1776808119084;
        Tue, 21 Apr 2026 14:48:39 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-479a02097b6sm9839476b6e.14.2026.04.21.14.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 14:48:38 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: master: Replace sprintf() with sysfs_emit() family
Date: Tue, 21 Apr 2026 16:48:37 -0500
Message-ID: <20260421214837.20939-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_144840_611980_DA0F6235 
X-CRM114-Status: UNSURE (   8.22  )
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

Replace sprintf() function calls with sysfs_emit() and
sysfs_emit_at() function calls where appropriate. This will help
harden the driver and help modernize it. While at it, add missing
newlines at the end of some sysfs_emit() (formerly sprintf()) calls.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 v2:
 - Change commit message to use imperative voice as suggested by Frank
   Li.

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
