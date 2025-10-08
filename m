Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3808BCCA470
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Oct 2025 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xY2ggZbUPqyUaK+fXjiyAm+6GvXH3H3c2x80XeFqVI4=; b=cfSL1I/WhicEaY
	7WleTqE0mmzuthaoEVa9/wlkKFPk8d8i0PivAAwvpqaEPJ0PS2zV0SObaACDq/xnWHGGfLfhu+Nl/
	mrOOODmvf065tfhv0rJ1kty8S3yXWLR7sdNKlO2Rp8YzQhwr43dREEHwLaehBMMryS7WSzoQe/KTZ
	DweonHVRcOV13yaZ8qrmabYcOAoYTHD7atoubmILr+JCTFn/b8PP4/DBBRuHTu4upOTh8H6l6IyUU
	xyXdOfAJfoGu7Rnb9rOv4EGTMKLms3SABy2u145p3fm8PaWTUsktJKYiTI5fXPgXFRg/YfClLoV/I
	D0eFwDHU9JXlslfJvq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6OaS-00000003LcQ-31HH;
	Wed, 08 Oct 2025 07:27:48 +0000
Received: from cssvr7.cse.ust.hk ([143.89.41.157] helo=cse.ust.hk)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6OaQ-00000003Lbe-0J1d
	for linux-i3c@lists.infradead.org;
	Wed, 08 Oct 2025 07:27:48 +0000
Received: from osx.local (ecs-119-8-240-33.compute.hwclouds-dns.com [119.8.240.33])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 5987RFgN2013116
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 8 Oct 2025 15:27:22 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1759908445; cv=none;
	b=c+ouuHC1NO32X1JJOhAfPfX6k5XQde3p7p+8oNbGiQHfnYq5WPtWyzyjj+7yh5Wig8E2Dg7XRCRJzFGZfHl9m7NbkiM98rRl+7Wo3cX8lJ+7KQMQ7+foeT4tVXeBaEeXDfZcN48WcLxlAJMhW4soEsj85p4H9f11lutrhBDehns=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
	t=1759908445; c=relaxed/relaxed;
	bh=1d+fJPm6FAmG/otg2kfvoAFrk4yXq4+Potk4oSH+KSs=;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version; b=IfUN5OWwhGa+eOTLxT+rxnHxr3EoU/U+hmLrYL63ReFmjcqDWxLBwVDYIaQMxI19CVDHgfovzqK0XfkoiIV7+XhpY9UZIcKqs3oh5mYm7/KgvXGb1mSYZy5o/OjohYNAWifoCdi+Gk+/IebUCLwjRE4rGPGsRlwOMFb0TuX2akc=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1759908445;
	bh=1d+fJPm6FAmG/otg2kfvoAFrk4yXq4+Potk4oSH+KSs=;
	h=Date:From:To:Cc:Subject:From;
	b=43HKo5xBJrsMu6WAVuqJmrtMbv5JQ26vixFRQyLXUm4CzdyYosvg0gHfzdw+xkzcv
	 qBRlp+XcCCqvmIC9KDviPkXhMfCgw8hzwgrVU5T1DoKLFr9DocnLVwp3dhM1YBWjBD
	 AxbLaEYiLyNEulEphFSO4/kzmvh95s2EF2L0KmrM=
Date: Wed, 8 Oct 2025 15:27:09 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <aOYSTX5EA_nRoIY_@osx.local>
MIME-Version: 1.0
Content-Disposition: inline
X-Env-From: sfual
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_002746_749132_C17E420D 
X-CRM114-Status: UNSURE (   8.33  )
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

In `i3c_master_register`, a possible refcount inconsistency has been
identified, causing possible resource leak.

Function `of_node_get` increases the refcount of `parent->of_node`. If 
function `i3c_bus_init` fails, the function returns immediately without
a corresponding decrease, resulting in an inconsistent refcounter.

In this patch, an extra goto label is added to ensure the balance of
refcount when `i3c_bus_init` fails.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 drivers/i3c/master.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75d..9f4fe98d2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2885,7 +2885,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	ret = i3c_bus_init(i3cbus, master->dev.of_node);
 	if (ret)
-		return ret;
+		goto err_put_of_node;
 
 	device_initialize(&master->dev);
 	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
@@ -2973,6 +2973,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 err_put_dev:
 	put_device(&master->dev);
 
+err_put_of_node:
+	of_node_put(master->dev.of_node);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_register);
-- 
2.39.5 (Apple Git-154)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
