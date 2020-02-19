Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D88EC3404F
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5352424672
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHnDzdoQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D7yEFYsK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5352424672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UqkPPwTAc4jrQDM0KJhyNTsH4SkvmWUG/XR/N/WE2Ig=; b=IHnDzdoQtPISTJoC5ZhfZ7qGzX
	/4jou/bf0mzHagp4HxEp8S2zTvfTvbmdOXJ5RkcYyx1xo7ACRgpmr68Ry1EtE2Oyhwtx794r1iUBL
	3nEJY8oBzXqsexqhBUXRvRI76wLTovbJyhNGEh8XXBZa7whguT92DMOFCbEnQTxJYKvKevkm0WLPq
	1IWppaQPVqxxOOKjiFtwTRV8Bw5aTyQfRCezwSXZcnK+WaRe3N1pNeK7L7pWK8e6EyvGCzPpnfzTV
	vm4bglJe6djO6WPbGRl+lCPvtzXjpN4OlHVJFM3T+arr4jpMYPN7BfYfDc7EC7NCQgCo0y5ptyo0J
	BvIijTwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4D6p-0007bE-17; Wed, 19 Feb 2020 00:20:59 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4D6l-0007Xd-4i
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 00:20:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1ED66C009F;
 Wed, 19 Feb 2020 00:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582071650; bh=EWznO/7FCN3HQvpSq9KAAmnQZlA5wLD6bU4uUlvRy1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=D7yEFYsKiCNN/fVOHeWcjILm9RSnalwliFqbs+26c49s6SbQgmtuEzmRAD5AnmmD9
 buKLT/6BPv+SlLAjyi85dhWbg5e4/0Q0Ze6TsCIgo8fsdc1UJw5n7MVCI3cwP1W8W4
 fj+JkBlc68RbAfa121TfFBVwlTA9Mo2BsH8V7zb/nubkzCznltDxrH7tAJjwLUY7s4
 Q/du/CZifju4EeOpDAmOI1rHyJ3Zfp4RNR0hLlhJ/0VCE79NCbaRD8LmE5A24EtJmT
 aSGf/i8yKBYsL825kgawfp6LTlh9bNsExdmo/CISQZPDJE0FMxm9YU850sn6ER+ojI
 pWAdZSMDBOhfw==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1C355A0077;
 Wed, 19 Feb 2020 00:20:47 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 03ECB3D244;
 Wed, 19 Feb 2020 01:20:47 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 1/5] i3c: master: export i3c_masterdev_type
Date: Wed, 19 Feb 2020 01:20:39 +0100
Message-Id: <7c742fba6c488b29f6fb15a5b910e799d50c5051.1582069402.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582069402.git.vitor.soares@synopsys.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1582069402.git.vitor.soares@synopsys.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_162055_226460_34C6A650 
X-CRM114-Status: GOOD (  11.82  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, gregkh@linuxfoundation.org,
 bbrezillon@kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>,
 broonie@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Exporte i3c_masterdev_type so i3cdev module can verify if an i3c device
is a master.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/internals.h | 1 +
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44..bc062e8 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,7 @@
 #include <linux/i3c/master.h>
 
 extern struct bus_type i3c_bus_type;
+extern const struct device_type i3c_masterdev_type;
 
 void i3c_bus_normaluse_lock(struct i3c_bus *bus);
 void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f8f896..8a0ba34 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -523,9 +523,10 @@ static void i3c_masterdev_release(struct device *dev)
 	of_node_put(dev->of_node);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 			    unsigned long max_i2c_scl_rate)
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
