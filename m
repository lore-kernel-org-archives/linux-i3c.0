Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924FCC982ED
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BpG/g7yVXpB92ejCCePigm7JFSA3j4L2TipTlI3taKw=; b=JpKdvgB2uL7CKu26Mg1LQVEiy0
	6nextOxT4d736Xt74aB9UpkgfvgOigwh4w7WdegR7qE0891MtgWiSuqxo0gmoT7VuiahNXPV/FfYO
	072Ej0sweCUNsdic+br4RhD4G981yGnuIfh/Ki7p1pJPRhwAYb42Kc0CqjzRg3IVveIATI22XUcR4
	H3q/qL534CwaRpPqrbFrhNnQfu5muJb2+yvzlUMOV+F/fMEwOxNFv9NC3zJ0YlJVYO/4H7i+MGcDD
	pCnv2lcCnPj/Fgw86lCSTbgABQXmrMNMKS2pYxVzaGo2SFEO9g8nalo0cX5E+PTF+/7mnQ+B3S0YA
	+2o95E4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6b-00000003dVo-13xQ;
	Mon, 21 Sep 2026 23:07:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6Z-00000003dV2-49Gs
	for linux-i3c@bombadil.infradead.org;
	Mon, 21 Sep 2026 23:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fKYG5VGbTPWmb7q1Nsotz5JXyK1vTlAdhH+6NwpOCvM=; b=TvxZIrn5UPodu+eHjmv0YHyuft
	YH7bviPAJ5wk6hdllgOnVGlDAmk5UfnAnUeygOMQO+DNXDqiKTNj6fMg1GR597oAZHBkbQ0NdwegG
	+GX9Jrgy8wcfa/iHigwkOIR1NmwbAaJ6H+VktqapLjuVsipWbOjJmQDEfWIH6bDqavYk7jqQgw1BX
	OFcEWjPNO7sD5AazoZplonYNlzTrhxNUutms8ONWLV++o2NUD1LUeszsHpDVu+neV67pYq53FaZwN
	/Rtz47CvCSKlNi5QH2vNcQ7nJTB90HGIRWs5Hq9n5AnFHdldaYUuqXVORnHkESmpiMxGI8fLsGQBK
	a2BLtJoQ==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8n6O-0000000Cu29-1G9J
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:07:22 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cbb92868263so2962492a12.2
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 16:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032029; x=1790636829; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKYG5VGbTPWmb7q1Nsotz5JXyK1vTlAdhH+6NwpOCvM=;
        b=s1uPUDzYi6VSXbb6sHC4cQb9AiJ+NIHnsscVzTplOCJcjDc+LYyPfPjL/jc+8SoAX4
         6RePAFzMP37RtIlf71ZvNoM/0hvy+TJzA6yVFZNtI+qlE5437bFQUsSuxfi5dGJim+Br
         +Q1DyNFB0xW3sQ+f3Y6TymTR5L66EV9alCQgcBLDlk4k5fRTaRoyUOt090IS3f/3GlPe
         doGqsxiHO1zfQHVlU62ts+haRWvBHPUu+OZxo49Ox6QEhU7hkBoze395fi1lidxasxBa
         o92wVdQBF1NsUQmoTGKpblDxWkEwrZHcg15rgJ2Q8OrqsklvVSv2w+l/hapvEpVZbcHI
         hsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032029; x=1790636829;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKYG5VGbTPWmb7q1Nsotz5JXyK1vTlAdhH+6NwpOCvM=;
        b=iLreRSXZlQDmZR0Rcd3NHpkBagw0vRGMCwzDO68eRe1SZ6fa2PpvEhHX2S5Sib842W
         uqKReoyl1oBan3CaeZt2iuV5P3xrK0Z6TMUEJcbCUeRB9vNHxQfLtgiRM/MbGUZ1+lgD
         w2sA78KdxjYOR9W4mn1G1KCfpgwvHD/ytOqqV4+T3OCprog8/e7zSHTdrg+NLJUdRKtZ
         /utegHs0KwmxdmihrMkxrFk0eC7LTjQ/ysw0inNDEvRJ4J8eKOIiTpSKA2t33ep1/Ccy
         vdajhMZF9O55aHj5BGcg2fhuxbWxPzGCn2XwXPXusgdJi8yVPNH2+jvtDdWX6vdBVVH+
         lh/Q==
X-Gm-Message-State: AFuF++lLSzpn8alKk/FFkzK9vzlBdtHC03G6/KXtayq5jLn3Uo0fi1Fv
	MGJhtGdN5sqJF80djcg+8W3rolwpH0bTJL9gG1yjT0gWoi/k7HVGq25fkbLbWd20t5LLDlNV66E
	dHPz4ithZNKinf+5tnvQ6/gQERsOdlv8/bmP8WmYEf+MXWOMZPSterzqmMGz4ZSUuVt08gc3xoO
	vts2Ry5F4qiYAam6FSSCokWX7ePpGBBHCk+I8Nbk6dNH9rgrtLjl5ZRMJFe+31NHy26c5zMpcRE
	uhbOA==
X-Received: from dlae24.prod.google.com ([2002:a05:701b:2318:b0:144:d326:40ff])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr11930087637.84.1790032028317;
 Mon, 21 Sep 2026 16:07:08 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:05:59 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-2-samagazaryan@google.com>
Subject: [PATCH v5 1/5] i3c: master: export i3c_masterdev_type
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_000714_322900_EACB9E15 
X-CRM114-Status: GOOD (  10.92  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Export i3c_masterdev_type so i3cdev module can verify if an i3c device
is a master.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..cbc00c862104 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,8 @@
 #include <linux/i3c/master.h>
 #include <linux/io.h>
 
+extern const struct device_type i3c_masterdev_type;
+
 int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
 void i3c_bus_rpm_put(struct i3c_bus *bus);
 bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..e8a9f8c3041e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -864,9 +864,10 @@ static void i3c_masterdev_release(struct device *dev)
 	i3c_master_free_i3c_dev(master->this);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 static void i3c_master_shutdown(struct i3c_master_controller *master)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
