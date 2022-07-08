Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31370C43334
	for <linux-i3c@archiver.kernel.org>; Sat,  9 Jul 2022 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMWw1xWNhB97hjAYAJqKqLXEKWO/MwtX3JKDJqu4M+E=; b=C3dizevmMuA4/B
	Op5j7V2N8lMihkqR8iL5RDmXQ/gS3OpbrEHvELG7QNiqCErQtg63az5Apg+YUvobBxeC1W2VU2ab5
	v0s/OzE4gGnjTiYYgs5eCfplw9G8MhsTgAxzDwnM1a3yKAVk5pKl5Z4HwJqft6RhPvWyYwa1J8j8g
	3xKx50R1FhecA8kmRtxegQvGAo8tjsBNFXdk0S8JT7pLgoJ3LrLZRexYJ4LdEhBAT9ObLF3DQeldU
	fJyFCteZL20KBLaGIWngElPmLCoXlI16TthdnHsLNJH2W3cYaD0QIWyYufG60rAUO4jtRfwM5mqYG
	NU8e4PLbTFKZvh7fANnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAJ3N-009hwd-6u; Sat, 09 Jul 2022 22:35:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9rAu-004mg1-Vj
	for linux-i3c@lists.infradead.org; Fri, 08 Jul 2022 16:49:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id d16so24980780wrv.10
        for <linux-i3c@lists.infradead.org>; Fri, 08 Jul 2022 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpYvopWRDye1t/WPhr4FZs4vO+X9s+WDCsuSJIPNESw=;
        b=WNli1ysfgn5wKLkAfGWIaJTBAb2A0tDwa/HWFDA5ky1HT4sAhOAeKoSDCDDQdR0cbp
         ZZCy30UFwFJB8DgYofwVJcOIpBjs9BQfw+FI5h0dFfn32S9KyD79G1UpMgqsBKIwFZyM
         rHfwWRfjD5PjzCv3xEIc/RoLyJYPqCXjN35cCF+TQL/QQRyTBKNcCc4bBTqCwBNhjvqb
         XpjRl9g4+ytg+wW+NfmItvB/lkKBGfcoi/GL/2Q+TVUktKh2HnqOkrfhC2ryiM+9c4ux
         6ty0PoV1W+8QxiMm8d0UqesxyrE+VB/75rpt6eEk5Jf2rRlg2vIg5nrtJVejVpJy290t
         dUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xpYvopWRDye1t/WPhr4FZs4vO+X9s+WDCsuSJIPNESw=;
        b=CXolEGj+3xIsofW3Qyxe3Sbj62OTjQIlXz1WwPO2t9LbujpcOHHHbLA+OKI3hTMYDl
         1UAJMHR1YzqFtwAAxe8sPAdSmLaEfXyf95dSX57sRiW2gUrnoJkkg1OlubzzLjyvLLnj
         c0zk9434aNcENG5z8k6lox2yjKpOUxRd3Vw603F61ZBLVADRDWl2v+OqHpvmaOKmqWqp
         +zsea+X403x9/FObxqDWAXzK7YelcU44PhAlV5k0xE+Z2fJ/7YVzyeSr5uZ6d7VPPGDW
         J3J6AskQNofGmfYiYb1FidftnXtmyJEG18I7dCwlA9LPJpUV3M6GNwkv5n0Px0jxb2df
         3xAg==
X-Gm-Message-State: AJIora/tS+PsjRS85oFaY/qlIfCnEJDmJh//3I78NcuW/5hKK4RFz6cB
	sonDUhdyOxz3sIMjw65RKNEM9/y5EblSvtnq
X-Google-Smtp-Source: AGRyM1tmsAifgz0ssa4G0nm5T1k8cUa1tdtM3m6GOkSyiG1S4urJX2rMNelVNljOAuONla02M/qFTg==
X-Received: by 2002:a5d:6d07:0:b0:21d:1ee6:16c0 with SMTP id e7-20020a5d6d07000000b0021d1ee616c0mr4186192wrq.63.1657298990092;
        Fri, 08 Jul 2022 09:49:50 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c480800b0039c5a765388sm2472041wmo.28.2022.07.08.09.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 09:49:49 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	Jude Onyenegecha <jude.onyenegecha@sifive.com>,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>,
	Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] i3c: master; add error print for invalid node
Date: Fri,  8 Jul 2022 17:49:48 +0100
Message-Id: <20220708164948.268930-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_094953_081288_C7711D25 
X-CRM114-Status: GOOD (  12.86  )
X-Mailman-Approved-At: Sat, 09 Jul 2022 15:35:56 -0700
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

Show an error if the OF code in the i3c master setup
failed to read the register, so that if an incorrect
node is supplied there is an error print to make it
clear what the problem is

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7850287dfe7a..271d687d0d07 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2082,8 +2082,10 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
-	if (ret)
+	if (ret) {
+		dev_err(&master->dev, "i3c: invalid reg for %pOF\n", node);
 		return ret;
+	}
 
 	/*
 	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
-- 
2.35.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
