Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDEED10DDC
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Dec 2024 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qHJ1v70EDBFOoWBQgUt8yvJ4L7Qwj28GcVLmXEf6+w8=; b=xKYWW0sB6eqehB
	TbT75a8yDJmO/FTq4q9Fwvot7/CKJS8xmVlcPmD7H9t0MSiDmLHahp/SQD9q3gWZ5Nbhh5etBUeET
	fcAMMOZyyZlTaYaaJ228SlfzUpRdWXKR8c39wJ5WINgJVGwCX5WcscwH/ndWIQ2X8MkPt1bnTySPY
	3bKXFRqo9ioclXdaGusdTWQBMvZ74javviTLNAZpXzpgIAkdNCJWCNkWBKCSA9vKy04zMyckhBb4I
	uhFzZP/SzpNgDpztyx/5aan/+TrD8zIaZwFiClXZYTWS+YPY61CYHQ9tER6gD9DlGqngEUEwfzz/1
	6Jjpz2aASjpTplGa01Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2NR-00000005VNx-2opg;
	Mon, 02 Dec 2024 09:05:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFXr-0000000Ctsy-0o1h
	for linux-i3c@lists.infradead.org;
	Wed, 27 Nov 2024 10:45:20 +0000
X-UUID: ae6082d8acac11efa216b1d71e6e1362-20241127
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:9a4055c0-4e22-4d12-86b6-e32d1f9200df,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:15
X-CID-INFO: VERSION:1.1.38,REQID:9a4055c0-4e22-4d12-86b6-e32d1f9200df,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:82c5f88,CLOUDID:eb67cb614d52ad855d5fc6d6d836d017,BulkI
	D:241127183519U1COWKNK,BulkQuantity:2,Recheck:0,SF:17|19|38|66|102,TC:nil,
	Content:0,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: ae6082d8acac11efa216b1d71e6e1362-20241127
X-User: xiaopei01@kylinos.cn
Received: from xiaopei-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1827316142; Wed, 27 Nov 2024 18:45:13 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-i3c@lists.infradead.org,
	Frank.Li@nxp.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due to race condition
Date: Wed, 27 Nov 2024 18:45:07 +0800
Message-ID: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_024519_552218_45C36B13 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 02 Dec 2024 01:05:09 -0800
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
Message-ID: <20241127104507.H_i68UhRD2JcIxK7OkYpxSKD7PLRxBk9lSkT4D6fZKA@z>

In dw_i3c_common_probe, &master->hj_work is bound with
dw_i3c_hj_work. And dw_i3c_master_irq_handler can call
dw_i3c_master_irq_handle_ibis function to start the work.

If we remove the module which will call dw_i3c_common_remove to
make cleanup, it will free master->base through i3c_master_unregister
while the work mentioned above will be used. The sequence of operations
that may lead to a UAF bug is as follows:

CPU0                                      CPU1

                                     | dw_i3c_hj_work
dw_i3c_common_remove                 |
i3c_master_unregister(&master->base) |
device_unregister(&master->dev)      |
device_release                       |
//free master->base                  |
                                     | i3c_master_do_daa(&master->base)
                                     | //use master->base

Fix it by ensuring that the work is canceled before proceeding with
the cleanup in dw_i3c_common_remove.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 8d694672c110..dbcd3984f257 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1624,6 +1624,7 @@ EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
 
 void dw_i3c_common_remove(struct dw_i3c_master *master)
 {
+	cancel_work_sync(&master->hj_work);
 	i3c_master_unregister(&master->base);
 
 	pm_runtime_disable(master->dev);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
