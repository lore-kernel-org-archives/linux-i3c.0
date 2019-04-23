Return-Path: <SRS0=21jQ=TG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F204C04AAC
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2019 06:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 511DB208C0
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2019 06:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PaJpg2vb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CeAFv45M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 511DB208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W83InAouSOAwh9nTIOV4Zr9Tq+KNw4h/gaGisXjzy4A=; b=PaJpg2vbJmd58f
	/zDOiY5UYCDbs5Kj0VgorKFX0t1EUDFBdTHJiaFyR9UoQFJR0EfFe3uG/07zF1yepsoI/IBJo1icu
	7wQ8JPNiJgs5VuXfZNCfwp1sj7ZsSmQga496fNsRiL1NDOCqGDUzmlUiTtxmRJAD33fykel8jWn12
	ZF9FqXMaVIqZBoI5k9gpXCd0fG52R31NtDKEi/kS3E7uV3Gb+IFgWX27yeuDWS55CBZfeCHM9w3Lf
	CAnm8mi/Z1OWg0feFqd4FKCuSoe6Uk+BBg8srWTfUnUlOvpIgPpCI2IxsHjtg5gG0bnKHhKPiSTq9
	M+JR2uH2SniZjX91VWfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNWsX-0000RY-7t; Mon, 06 May 2019 06:13:33 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIsqq-0004Wf-Od
 for linux-i3c@lists.infradead.org; Tue, 23 Apr 2019 10:40:41 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3NAeVDT131464;
 Tue, 23 Apr 2019 10:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=xRfC4pM0OsF1QlCctmoqhF8daHuHrKVWGnlsIsuaE94=;
 b=CeAFv45Mmw2Gej4sBfivIjuCC3lNxB6LgM0QZ5swQBwMLBycV7z+/XioRyfsM7vBbIKG
 KUo7WjmZa/urFEPuLfN+/dZQ5Db/KF8t6jfBj96N8aKW1wBkw0py6zlOlGrZ3xIIdWku
 xdnbk9EsAer3i7IYULSezVzaG/LKWolFz9Y7qzhEylBaImC7ZlTqceTukAIm70jj5wJC
 ePuqSpLFlvJqZqcGR8QRt4nIPN/gJ6YAtjVUIF3ywLaPmRJPOK8H9UgwE1sD2Lz4syOD
 /aJz5MlrIzPfpa+bpgyISbdfI7uvByzYPHIHfst+HzbsIl8ahoCIeqUEhChLbTsL0nyd qg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2ryv2q38ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2019 10:40:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3NAcgLg168018;
 Tue, 23 Apr 2019 10:40:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2s0dwe6g5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2019 10:40:30 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3NAeTmi015794;
 Tue, 23 Apr 2019 10:40:29 GMT
Received: from mwanda (/105.55.146.142)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 23 Apr 2019 03:40:29 -0700
Date: Tue, 23 Apr 2019 13:40:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] i3c: Fix a shift wrap bug in i3c_bus_set_addr_slot_status()
Message-ID: <20190423104020.GA3133@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9235
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904230075
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9235
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_034037_037744_9F2E8BC0 
X-CRM114-Status: GOOD (  16.84  )
X-Mailman-Approved-At: Sun, 05 May 2019 23:13:27 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The problem here is that addr can be I3C_BROADCAST_ADDR (126).  That
means we're shifting by (126 * 2) % 64 which is 60.  The
I3C_ADDR_SLOT_STATUS_MASK is an enum which is an unsigned int in GCC
so shifts greater than 31 are undefined.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch is from static analysis.  I really know what *ptr is used for
and I haven't tested the code.  The other question is would be testing
this code on 32 bit systems.  Please review carefully.

 drivers/i3c/master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 1412abcff010..5f4bd52121fe 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -385,8 +385,9 @@ static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
 		return;
 
 	ptr = bus->addrslots + (bitpos / BITS_PER_LONG);
-	*ptr &= ~(I3C_ADDR_SLOT_STATUS_MASK << (bitpos % BITS_PER_LONG));
-	*ptr |= status << (bitpos % BITS_PER_LONG);
+	*ptr &= ~((unsigned long)I3C_ADDR_SLOT_STATUS_MASK <<
+						(bitpos % BITS_PER_LONG));
+	*ptr |= (unsigned long)status << (bitpos % BITS_PER_LONG);
 }
 
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
-- 
2.18.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
