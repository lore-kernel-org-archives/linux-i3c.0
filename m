Return-Path: <SRS0=scUA=Z2=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BB0C43603
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Dec 2019 17:36:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285BF20674
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Dec 2019 17:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MkAm8TlQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="kEWbENSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285BF20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i+Bc3RFsj0iXpC5FOwRtmZc5Sv8Ne6tyZVeDnPMn9ns=; b=MkAm8TlQmuBOup
	XrAlZ5kUXRui+TZ/uNhyAOrd5eI+JCg1TEt0yBlTG5VVBDi0wS6sNeJu0HLy5yUawwv4dmIIZAQlN
	VGzLvwvwzxAywQqwIR2xWHQj5imwMjTw1vJ6hBm4yIR3EfmZute0iMDkOsPhF4SbO8mh2bxWoLsXA
	SS8EriaaLMkJqaI5VRJ7f7Bg4gOK+gLARhBcNaDY1j8JFM/F4mcrGd5KPLSG0C5DJFP2R+F7yvCkS
	jhym5OfXca246JnelhhWgmpuvqks2B/9IH6uDjrd+fY9O8C5eY5itN1IhEcRRHr7aYXDbJJSbGxFh
	9QqtEO4fH9DfEorWewzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icYZw-0002HA-0z; Wed, 04 Dec 2019 17:36:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icSKl-0006fz-3X
 for linux-i3c@lists.infradead.org; Wed, 04 Dec 2019 10:56:40 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4AqbBm000700; Wed, 4 Dec 2019 11:56:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rJSQOyKapDq+fBaxlzb265FeaVRs5hLYOgiTghRAZAk=;
 b=kEWbENSKsYE5KWxPGPGjJUJE52f1lMJ6mXkJcCxSr77KqphCsZu0ghrnjU/7Voa5yakK
 EHA/8MhSCbU2CPxRen+4HC7zsjhExP1yVZE0ZttsZDOkvq3FrzSVIbMOxOpxrlSE+RaV
 bv9NP+IJo500y7Sr0M+IIJsN7RB6B8O9ph6i7Cssi7bhMK+amN6ETA5SHn5OD4j5NjeM
 WFH7YCatSov8IBgEAlY7FTVyiytnnQ+A3GP6Bq+Q2kPdZJZ+RLQNJ4w2LFHsVhJtzhfx
 73XGnu0zWtMfdO6BrxajEguXmUHPDMZzE9/65wrpm1bvkxiov52i57NuOHCFOdREDfPb Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6kmk01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 11:56:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 946F710002A;
 Wed,  4 Dec 2019 11:56:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C2312AFD07;
 Wed,  4 Dec 2019 11:56:31 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Dec 2019 11:56:31
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH] i3c: master: make i3c_bus_set_mode static
Date: Wed, 4 Dec 2019 11:56:30 +0100
Message-ID: <20191204105630.27445-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_025639_615871_C886D3EB 
X-CRM114-Status: GOOD (  11.27  )
X-Mailman-Approved-At: Wed, 04 Dec 2019 09:36:43 -0800
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
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

i3c_bus_set_mode function is only used in master.c.
Make it static to avoid warning when compiling with W=1.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/i3c/master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 043691656245..7f8f896fa0c3 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -527,8 +527,8 @@ static const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
 
-int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
-		     unsigned long max_i2c_scl_rate)
+static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
+			    unsigned long max_i2c_scl_rate)
 {
 	struct i3c_master_controller *master = i3c_bus_to_i3c_master(i3cbus);
 
-- 
2.15.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
