Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD161098787
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Mar 2026 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fkOnaCNVwuOvm9uWMeqfRL70HSlqIBPU6bffz7+0/xg=; b=C62DFCtCrrPQ5t
	VtK7WM/SwLl0lUYdDg8UwFol4xCIA682KkpnDIq1ukSWa8NYMIw/AT6p6xuYJ1a1hSB5tpzFL+ltV
	FpJdJsdCKU9cryqShZ99nYaLaYXgp29rv+K1u2BBnXK0KyXbcia4XZJp7aw4DQZ62aleqv85io16B
	39XImy3EVTK17KmOat1h3Mz5iXZDUg5RnWOlfTjPvDa6l0F1ciPLVkZc1bSpk9Y46uZMg6d6tWuIt
	EOVEfD9XneBZCRejDC4lgWob0fyqlwQfa604UX6GzIP2ui6uhU36vMcUUnSfJE7m3CgqtlDHN0qcB
	vPQamAOm/WQ1lSmHry1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3afy-0000000CvDe-0CNj;
	Fri, 20 Mar 2026 14:18:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3afv-0000000CvCs-47pR
	for linux-i3c@lists.infradead.org;
	Fri, 20 Mar 2026 14:18:09 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso1412391a91.0
        for <linux-i3c@lists.infradead.org>; Fri, 20 Mar 2026 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774016287; x=1774621087; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTbxAMwyB7B6p0dqNCZpF7kgRQZLM7fb9kUoa/lAo50=;
        b=I73Ciomny7dDPRp86TSIASYx83OFClD6S7xWVzhfZHOl+4d4tIeKW+TBmabwlth4Gl
         FJy9k//9huziW4B8Kep3ZtHO1ixFPH2gWamsf0Xroc7XyK1wG4rOMzmkcX3tJEfAm8Yz
         0uF24Bd9j2cqgwcfQ4tXTGE+H+oGY5FzQr29Bil7r+Wr2Okb+oQLXsu0K2S5VctTNeoF
         u7py3LBtL1ShEw7uROaloQalWCsly0cV0wTj10+Bcd7ds6DHyOnhFCODvv70Xv6iGWTC
         SSFe35pjNOsh+vzHD5LXvJ4kq9qQ6TM6No58x7TmPTMS2ijwVn7ZCtGXH8G8DIzLZCD4
         gNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016287; x=1774621087;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTbxAMwyB7B6p0dqNCZpF7kgRQZLM7fb9kUoa/lAo50=;
        b=qr0t45wxWAF+vwvxIxRtZDdRHNPVpNqgk8Qm8r4gvO4AdXxXo4AUWRKq6kPfsUE1sT
         s4M7i4qWY2fzztk7ezqQJYZTxHypRK4iNDED42IlO3qZfR7S7InFWQlQrED1/lzpEZJb
         8UpDjqdd73+VFtinzsCXD6iwypuEJrwAABquGZl0JzkfkgIjS5KP9h7ahMK+xnIiwtNu
         fx1PjUav3VacpqbkIKflS20dOH3Py5ld0CeHQFEuw7jJazOUVarZr5OrBFA/UjAq7vN3
         3JYWzEs11r73SSIxom6X5DYJVF0uUnC6AdunM2ddcJhxbK1cJW6mxQJk+5ncd2Qoz92L
         8eCw==
X-Gm-Message-State: AOJu0Yy0+C5j3lHZyq0lyw31Sf/I8z8nvvTRXzbcFrktH/9TZTtr4Itz
	nS8L9NhR1m4sO/oBXyJg9GJPF8PI1RSwt+TATpi0tHDOHBtQxf/omEJB
X-Gm-Gg: ATEYQzzMEYi+og1T1IHQN1lXzGk02ezRzYftP1RHUQpky6gdawk9n1Aj9XBOL5I85Ux
	qq+V2UCMft6qZmtBlwK2S2rEGP20TxyUqmSqeNes+vjG6+rluWJF6atxV0/L6BsppVQJtOlN/0r
	JYzIY3gBZmMNF6RVAfIo0MhEYFFK6pcHVLSGbrwUIMl3PXLhY07gFkdiEg8+vBEQ1hAfH6qgWdq
	28pLuQsAx371dHeOZuuh47Qfhb5JmMIhOECZq0Zni8aMw6oAbkJs74tJt1Zll4icZhxy8WhWbHT
	iD31hd5ypIheGYnXqK6N/AMb0gwqUSIOjJykKdvfRtgntxTP970QmhZ0JTdAMesCZkS738akU93
	lU9N8cvRcFg9XEsfEIa4rCWuuRycvXMwTiVlsVvw36ex+MZa0Dh7BENTnXa2/bDW676nc0BWmbv
	+a9oQKWMF1Cx4guXsA/Xx/bvWKjHr2YVJV5ZJc
X-Received: by 2002:a17:90b:28c8:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35bd27807c5mr2206862a91.8.1774016286486;
        Fri, 20 Mar 2026 07:18:06 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm5543815a91.2.2026.03.20.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:18:06 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 20 Mar 2026 22:18:02 +0800
Subject: [PATCH v3] i3c: master: dw-i3c: Fix missing reset assertion in
 remove() callback
MIME-Version: 1.0
Message-Id: <20260320-dw-i3c-v3-1-477040c2e3f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIABlXvWkC/2WMyw6CMBBFf4XM2po+sAVX/odxUcoAkwg1rakaw
 r9bWBgSl+fmnjNDxEAY4VzMEDBRJD9lUIcC3GCnHhm1mUFyqbkSmrUvRsoxNFbpxtVcVxLy+RG
 wo/cWut4yDxSfPny2bhLr+pdIgglmm1LUvOycqfilHy3dj86PsCaS3Gvmp8msdfZkUKu6bES71
 5Zl+QJcsn0g0wAAAA==
X-Change-ID: 20260316-dw-i3c-e7a36bc90682
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774016285; l=2383;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=R0Z3bZeV0hh/U71x3Ob3WsiZ81BBR7uJWzCgGE2x66s=;
 b=CdZU9wECBXs9XSxNzfWC4JQx/or1NGqlbLm/T15s7ikS2xhAg+X/CtJ1LtL3twxzDv63Pg3/B
 ywt8Hjr0/8bCx0CVbD0OTk3TRU907kmjiL7WQ0XE7BbO/RGuyfqZvIX
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_071808_052281_31D205E9 
X-CRM114-Status: UNSURE (   9.94  )
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

The reset line acquired during probe is currently left deasserted when
the driver is unbound.

Switch to devm_reset_control_get_optional_exclusive_deasserted() to
ensure the reset is automatically re-asserted by the devres core when
the driver is removed.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Fix the format to pass checkpatch --strict.
- Link to v2: https://lore.kernel.org/r/20260317-dw-i3c-v2-1-fa57e6394b1d@gmail.com

Changes in v2:
- Switch to devm_reset_control_get_optional_exclusive_deasserted() 
suggested by Philipp Zabel.
- Link to v1: https://lore.kernel.org/r/20260316-dw-i3c-v1-1-ab41904fc780@gmail.com
---
 drivers/i3c/master/dw-i3c-master.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..d104807cf74e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1606,13 +1606,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								    "core_rst");
+	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
+										"core_rst");
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-	reset_control_deassert(master->core_rst);
-
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1624,7 +1622,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			       dw_i3c_master_irq_handler, 0,
 			       dev_name(&pdev->dev), master);
 	if (ret)
-		goto err_assert_rst;
+		return ret;
 
 	platform_set_drvdata(pdev, master);
 
@@ -1671,9 +1669,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
-err_assert_rst:
-	reset_control_assert(master->core_rst);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_probe);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-dw-i3c-e7a36bc90682

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
