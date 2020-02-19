Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F96FC3404E
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F3D2465A
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 00:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPbKKUba";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q34BR4Yf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45F3D2465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DR+sySk8h6OAu7lpDZYheyklKMqkeX+tQj/1mYL0Dz4=; b=GPbKKUbafG/lOYjhpP8AupSjjR
	AVp34ToxJox4SXRmm4Car5gXBUqabZ2hIB/TMSssIzFjXUVWz0GodOkFpeOwlMJgLLopyq3G2JLRO
	DemrRj8yEeeg0Kzd9hUz54BJxbcKO/lxQe+BAF1VW0hQABViGzIIrXWq4SqaZAmtoXnh2wdcsTl6A
	WCRHHVrmpVD9sfqVr6oureyLl3FMPDmUTF6b8Md66tf/g8y5FGqkjqFLKXrqQiz+aXeaTz+PC/fZ5
	KEuV6dCM8qDyWngv8MhPSTO8c8Gzn68ddapzsihSOKew0gL0G5P7rUMiPoPCsTAtJNvPWRRKjBHjT
	Y34dMn/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4D6o-0007b6-UZ; Wed, 19 Feb 2020 00:20:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4D6l-0007Xc-4x
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 00:20:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2B208C00A4;
 Wed, 19 Feb 2020 00:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582071650; bh=49HIPV7UVjMJfo0JxqqaYUaFztMT5Pl+eqcCydvEj0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Q34BR4YfOfzg0GjdllVRD1JoImwYzmv9qLtGWrY11hQKY0Bawam1oWDCCh6cBRZj4
 uIAB1d5Vef/vBRUVnxI1HaS0shoT2T7flSzqvgIWpirFGpSY+SQOp7aiBHA+qMGwL6
 rWwZMhSeygkAzFKx+d/F/O0rQ4xG3nnXPDfNGiJmm0mxy1a0cvvJFjGQyWGAXeih/I
 uVe1CkIjvV8bR9JfO6dt7SmN3O5Lh1g5UseuGvmHadHi9qRmIqBfZKTZVhlnkXaWCt
 3sd5gEmYltG0aCy01DrPT1tk2UudkzAFDumGpU5L228peOZk0Lx4DQDQl4ZfazlR4C
 nqgVbdd2vm/gg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 3A98BA0079;
 Wed, 19 Feb 2020 00:20:47 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 26A223D24C;
 Wed, 19 Feb 2020 01:20:47 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/5] i3c: master: add i3c_for_each_dev helper
Date: Wed, 19 Feb 2020 01:20:41 +0100
Message-Id: <868e5b37fd817b65e6953ed7279f5063e5fc06c5.1582069402.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582069402.git.vitor.soares@synopsys.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1582069402.git.vitor.soares@synopsys.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_162055_246621_69675FBF 
X-CRM114-Status: GOOD (  10.31  )
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

Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/internals.h |  1 +
 drivers/i3c/master.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index bc062e8..a6deedf 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -24,4 +24,5 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req);
 void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
 #endif /* I3C_INTERNAL_H */
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 21c4372..8e22da2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2640,6 +2640,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 	dev->ibi = NULL;
 }
 
+int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
+{
+	int res;
+
+	mutex_lock(&i3c_core_lock);
+	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
+	mutex_unlock(&i3c_core_lock);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(i3c_for_each_dev);
+
 static int __init i3c_init(void)
 {
 	return bus_register(&i3c_bus_type);
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
