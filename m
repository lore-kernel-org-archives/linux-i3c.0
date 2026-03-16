Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAB3F506D5
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Mar 2026 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pgxGWug4+oJWi0OLNciioRluCnPuu2c0msslFKFZVJQ=; b=CPtoGUcbGJQL5M
	eBDty+Jm5EE9QcXkEOKE8iLcOb9HXmOII25W7rBdgH2cnpfW2GP666ePZidhbPI22nqFLf+yeq+3q
	TyZxNbXLokRCGEsw30jhqDSVIdBp8r9T8GREQJsTAW4EnIP9Penjy6x+7060Rvc6apj+RizEaNein
	Ob45cZ0T/3C2PGROIIEF7+r3BMKSF1A9I0PXf3zUfeHmuTJx0UHE8tz9OhmpxkJA0cfgnhA/AFPz8
	0MO/HI2wDBqQC6PSnNIpHYH6d9iw/ekUyR5GCY0NP50XjELxu4Zn8e0b0QFsRONraQEmSxOjLlKJ5
	Y+ViWSx5KD9yTSyiGPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Pn-000000047Cw-0CGZ;
	Mon, 16 Mar 2026 13:55:27 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Pj-000000047CE-15WI
	for linux-i3c@bombadil.infradead.org;
	Mon, 16 Mar 2026 13:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=+bBwCHE0+XTEXGd9Db5D2eTxlK+o/dfuXZJzTj/yqCg=; b=mGF9soU2PknxEvkncAexXr0/Mb
	h7IrIHNNhKRbL426+tn5O0Y8rJbUeXDM05oAia0i6YHlObRpiJoiO7SLl5FnX9oHz/cagtWGFVKte
	PP8dXP6WiKJHFGoaCxqAHtisDSRJYOmwS5n203bcf/gNwsQE9grYJL+ORu0c6xbtn6feU5hgDYJB8
	q8vlPywcfxLz92uNXygC1zns6IbWbjlycCb8AP6y1o+KWNVit7DlxBD6zVdQAlL1o86cwhHSTWFHz
	jYWWFFpcnUZP++IukWwYutnpUueiJcQBJi4t2npUMWuMJfGETP4FBv0+AAN++dUMMn5BN+xIKJ+de
	ge/ArILA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Pf-00000006sMx-00lg
	for linux-i3c@lists.infradead.org;
	Mon, 16 Mar 2026 13:55:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so3034612a91.3
        for <linux-i3c@lists.infradead.org>; Mon, 16 Mar 2026 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669317; x=1774274117; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bBwCHE0+XTEXGd9Db5D2eTxlK+o/dfuXZJzTj/yqCg=;
        b=GJV6+n8mI37+lRwTL6aoo7JA0QFeHgtHEKdIdFRljOAaz8i2Bzm23pEM2qxl2+ymqM
         4Zjr1+5OQfRjmJpRCaUppmnvZ/f+YtxvQx4sDU1yOCh0j8gKTp4dkSDpLXXUpo5fprgU
         Do/wCLQhf2qcp42dCN+GPb46MqxGYsscsRpdo6S7nIenLEt8octObaGBJP9y5BGYmRGQ
         kvbkn/BYSQkntGnQvh8+Ep6Z2AhffqX5MbKGIm9q8UgLMGrQcMyliQLeCOZyHpH319Tg
         8KhYX2MqnUSYUUKV9Preinb1Da7kceE3667fnJNDwI5o8rA41+WAjLKMKTbEW1hvesSt
         F5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669317; x=1774274117;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bBwCHE0+XTEXGd9Db5D2eTxlK+o/dfuXZJzTj/yqCg=;
        b=onJS5gACJF3ydB0MXBVdKX0VfIt5v3ge15x0oCxgApAUceR8A7wujFqSy9JhAqPDqk
         ByMD7asOk0w4/fAu+HsKScLpaat9qoxkDqZhFIGloNqkyyyde79pFmLdkjmeA+S+rCFb
         YCCEIgQBxIteKsrNOSjt/ZHhwkpoZ+1R5N5EZDpqWwUjzwAmlFiTokJss4fbWC/TvLa4
         r1oGR25Y4NyzLljjfN2pl7HCrJ6TdVS3ubtAFwucGILoJKu8arMmGmn/bxOFp25WlFuv
         CnmxQAhqn8cYTBQEHkMyYf7Q1Ag0ot/cDeDUOdPqV2L1cJRu7u1vSZAFERtCNvahaMV2
         bu+g==
X-Gm-Message-State: AOJu0Yy0XUISWp6Mth9ybfbGSo3NBP75OJ5Nqn7B+GJDA1I/ffCVydqo
	6JUNToGdXXCrxVU4RnR6iQNV2nm/8YZ4juOyFzh2TJjRFYIeZVjVZSAh
X-Gm-Gg: ATEYQzzZNF1REDfF+Bqxw+QeOeRAbjfFwrYOPWVA0I029S9rPWQk8b4sc+1jbUx0qIu
	0PA/2ZMm0C27hQrFFYrdaWWN1OulEmgVnzVxyG5G/0rRNr3RtetgDQxcmoSVUn/u4S/BiE92Mbz
	XVzC0lm12DI+AE46gmxN4iksAkLbqRFiGPDMZR0EGGkuj4hm+yPL9Qksvt85IRbepquy8LWvAn6
	UpnBSBJlygYrPOr/It2gIkYx8wCnN9M2ihNuZjV4zGxDq7eslI8hs1osCZp1Z2/yg7dCYQ9dQkz
	PS8MU9dsWq9n7vG2wsYxzA/OsGA7muNKcZfAbcuARsz8r/gULiQ9qCrfNPLOgX/yVHl9oTzkWXR
	0ZyZ5P3RHr0yRxAsj3ivoce5iz27i14A268q9uTdmizMH+GjxnIEvs1TDcRwMs0tCi11GXgRNNZ
	R/um1l07QPzc0FJF2wL9WI5QZejMRtT6xXX+f6
X-Received: by 2002:a17:90b:4cd2:b0:35b:aca5:db39 with SMTP id 98e67ed59e1d1-35baca5ea17mr136887a91.9.1773669316886;
        Mon, 16 Mar 2026 06:55:16 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9b797ab2sm4289218a91.7.2026.03.16.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:55:16 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 21:55:12 +0800
Subject: [PATCH] i3c: master: dw-i3c: Assert reset control in remove()
 callback
MIME-Version: 1.0
Message-Id: <20260316-dw-i3c-v1-1-ab41904fc780@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL8LuGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3ZRy3UzjZN1U80Rjs6RkSwMzCyMloOKCotS0zAqwQdGxtbUAMU7
 9I1gAAAA=
X-Change-ID: 20260316-dw-i3c-e7a36bc90682
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773669314; l=1063;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=II9mWdNC7A0Qf7SEQxHliXIq5EY9hrP0apF+NPPLf/k=;
 b=74aFsLvZnJ6NWJv6wgnUw89MSbdD46P6jMvpsUoftGEQYJy5q1F+7yQ1J8UIRyN+5ZIAWum+s
 7xjW8T8/28WA7kZ57NuAxjV1y6UX0X7s7hXOS+udoXAZs68GE5sv7aw
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135519_209102_C4CE7001 
X-CRM114-Status: UNSURE (   7.98  )
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

The reset line acquired during probe is currently left unasserted
when the driver is unbound. Add the missing reset_control_assert()
call to properly reset the hardware when the driver is unbound.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..5303282eb816 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1690,6 +1690,8 @@ void dw_i3c_common_remove(struct dw_i3c_master *master)
 	pm_runtime_disable(master->dev);
 	pm_runtime_set_suspended(master->dev);
 	pm_runtime_dont_use_autosuspend(master->dev);
+
+	reset_control_assert(master->core_rst);
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_remove);
 

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
