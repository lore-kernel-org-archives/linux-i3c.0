Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73645C83F03
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Jul 2025 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+QqvIURruZCCPb72X+SXbYvWmmrYdN0gW1/1m/NUZo=; b=mbyQOvyd8HieNE
	LnSDpcGamCzPx4VLx4ak3kCh9xSOphKKvrIia7h/T8ObI99IptUjIsDKPPnyttwt1osCKfj5f7xM9
	2QKQ+J7fNtaJvLWAmV3mIa2OSIyKF/3GEwu9tLODet4PWRBZ0MUR1eYk2CN16XUTSS4WfeiNuVJ4n
	bV6Z3rN8SOcEwTgkBNKqI82fDBZkIwGXddPlhsvRvkkcpiX7uzWU8LmDlyCvbA1mxbgrBXd+CSZG0
	vf8i5V8zxdlqNn4Yjht+iKuJgJ1UB11W9nFeHMXsSbKYtuiDPBYnwPLaq6M09KYH5IP1fmDKsa077
	LOVLUzuSUpJp2BJQuCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXnHs-0000000FT7J-0U0J;
	Fri, 04 Jul 2025 20:45:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXnHp-0000000FT6m-0z8Y
	for linux-i3c@lists.infradead.org;
	Fri, 04 Jul 2025 20:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=a4IMrFGuflzsCi
	L4fRNFfdfAnrYJH3pRPbOcnAIC7s4=; b=Ujz4EXF7H00IRVlREAJRDjIDuivgRo
	1tR1FTc41lCy4mNDsSh4SFpjJPR/eyx1+SUJL1IEi/RHIUGwLWFiXwn04HPrxxif
	Rgw7L3sKUz+wJc8bqMT++REJ9906fNhvgEA3yYcAlYDR0GOljiV6JJWpAOLuFM7f
	SzaB2muEqFCWWAbPsWJ9VUAwvX1QasUAamRU8gHt6tKKEFoY1pJ/FcbFswm5Y0jJ
	vctG2CPJ00tDQtKRcFeQukGnTSildUGTKUaTsp863FotDjQG+6NDKpVCHzmPpPtL
	5fYbOU7jSOCH1sRsUtEimBaNM3mxXivb0MlY7G5q2uZd7gIAfTTQqeYg==
Received: (qmail 265717 invoked from network); 4 Jul 2025 22:45:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2025 22:45:27 +0200
X-UD-Smtp-Session: l3s3148p1@DtbpkiA5JrAujnsj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2] i3c: don't fail if GETHDRCAP is unsupported
Date: Fri,  4 Jul 2025 22:44:32 +0200
Message-ID: <20250704204524.6124-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_134533_548919_118FA3DB 
X-CRM114-Status: GOOD (  11.35  )
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

'I3C_BCR_HDR_CAP' is still spec v1.0 and has been renamed to 'advanced
capabilities' in v1.1 onwards. The ST pressure sensor LPS22DF does not
have HDR, but has the 'advanced cap' bit set. The core still wants to
get additional information using the CCC 'GETHDRCAP' (or GETCAPS in v1.1
onwards). Not all controllers support this CCC and will notify the upper
layers about it. For instantiating the device, we can ignore this
unsupported CCC as standard communication will work. Without this patch,
the device will not be instantiated at all.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* updated commit message

Please note that Joshua Yeong was also in favor of this patch. Sadly, he
did not send an official Acked-by yet.

 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index fd81871609d9..e53c69d24873 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1439,7 +1439,7 @@ static int i3c_master_retrieve_dev_info(struct i3c_dev_desc *dev)
 
 	if (dev->info.bcr & I3C_BCR_HDR_CAP) {
 		ret = i3c_master_gethdrcap_locked(master, &dev->info);
-		if (ret)
+		if (ret && ret != -ENOTSUPP)
 			return ret;
 	}
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
