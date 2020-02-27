Return-Path: <SRS0=/dce=4P=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A533C4BA3B
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013F124696
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 11:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+J/ns5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dvCJhmsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 013F124696
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m2rgpcQ4oGrv7n68r492i8Nb3qPbf0dUWS/3LImodgU=; b=k+J/ns5Miv/NU3h0c9lJSKLZWW
	g7OOrft9gp7tAPzTYJrOOT7HhcdgMVpEnHZWTFL+7gTDEVTeR8KRIhv9RyJROq0/LNgDB1A6QpsZi
	Iepvcr2xwkU3EpeH6k0Qkw0GoRfn+HzV6lf/83r9oT9vZyk60+wph2hAh3C9aB/Q7SpBE3UujVNIP
	wm+ZNvQfQPkOyDCk+Xh/M7ijLQ5UeFmWLjOXOHTnKil7S70I5Rdc4hoKb4hCFF1jq22q4/mFZouuJ
	Deiw7Uz4IRhQ0w9dRNu4OWe3PlwNUvGBZ7PU7FhyqhEd79rLhgo0OcX0IYF7KDgDstOhO1GrJj+Yu
	QMVkOUlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7HOE-00066n-KT; Thu, 27 Feb 2020 11:31:38 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7HO6-00062v-RJ
 for linux-i3c@lists.infradead.org; Thu, 27 Feb 2020 11:31:36 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F297C00A7;
 Thu, 27 Feb 2020 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582803089; bh=HjU3/UYAvX0diKwyd/eFtyAIBjvPB4/hJGXSga3A9jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=dvCJhmsLtvnHfMu2mhVLbmZn4aW0d9OQKp2e4R2ukjhQhitHpGa2S1Rk/4OOYjNyQ
 Rv4TvEn1f6/k+bLg7s79B2ewFW4Lcv7xj99EedcfC8/MD6SllAww5iHYqfh1hDC/0H
 u/RlzMvdcT8CUTFwaMctgm+/V2FZYpg2dREiazR7WvULBN1dwjNhlD8eNqayimlizn
 E0A9Dq/g1k1KBFbs8o3VdKIcygW66aReHoKAwDG/JScCyBVdbg0ASNAXqh2v149MRI
 1ZM8Lze4Jd6j2Wz6prIH3ZHSJ7aQCZE/ub6/0uGLaA5guV5dQNqKDypH6ohqw74/t1
 pMKskfVaXlnrA==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8755CA0061;
 Thu, 27 Feb 2020 11:31:26 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 57A443E9E1;
 Thu, 27 Feb 2020 12:31:26 +0100 (CET)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: pgaj@cadence.com,
	bbrezillon@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 1/4] i3c: Fix MODALIAS uevents
Date: Thu, 27 Feb 2020 12:31:06 +0100
Message-Id: <9ac5f1f8413fbb0481de76b5e43f2f4e1b2dc49f.1582796652.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_033133_482287_8F5C8434 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, Vitor Soares <Vitor.Soares@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

file2alias uses %X formatters. Fix typos in the MODALIAS uevent to print
the part and ext IDs in uppercase.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index b56207b..b6db828 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -267,7 +267,7 @@ static int i3c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 				      devinfo.dcr, manuf);
 
 	return add_uevent_var(env,
-			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04xext%04x",
+			      "MODALIAS=i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
 			      devinfo.dcr, manuf, part, ext);
 }
 
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
