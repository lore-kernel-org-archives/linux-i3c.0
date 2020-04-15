Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31838C2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 20:30:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0B020768
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 20:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbS9Cvrj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="sJv1gBVa";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="Q801g/rq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0B020768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=idlRn6sKfYi/lMThYNxBiI7dSobyoZ+xyB5YfdoR3MA=; b=mbS9CvrjeFf9hd
	LTSoAWhQ1Eis/LJC2K332jh4Ind2aqx6sFldLVQFNhceHy6pY27+VSshtNLIPhwLhJZDC7nz1HR0l
	CnxOXgSAHSk1KdZt0vNinYz3VH9Cv3kwqtf5kt7vRnOTceo63fsup1gi3XTs6SOHeGAld6AGme6PN
	S7S7t6Ru3X2vgBhB4sqCNKJGrMEkwDEl82N+AKaQFMEmh/COTMVMChIIX+6QTq1Odik5tp7z802Co
	MiZGWc2FoOvSbQHLtnd8hH9QS+jgZ+wbo41l9x4NcDEdadl5udjT3CDAiwRg1METqywXW4kcYmCoG
	38k2cgDGVEkz5AkwP14A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOofm-0005g5-34; Wed, 15 Apr 2020 20:30:14 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOofj-0004p7-Ei
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 20:30:13 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 7037B63AF3;
 Wed, 15 Apr 2020 16:30:07 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; s=sasl; bh=VGN
 vyk0zxXkEoxt/Iq/16OTOfyA=; b=sJv1gBVati4G5hd7+IgRGKBxatjSngXV4qK
 0fgSTZTR3xs38R73gh1d0gjSX5auQ92TK+zzK2on65NnFW6dUkF0ue/ZAUcvRWUr
 MaqBDNnT5Js3jmN7gBBrjB9ISB8d5XbJWV/QOW/DNIkRaZzU3S4qieLf59xmYgv0
 YsT7/c84=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 4A49963AF2;
 Wed, 15 Apr 2020 16:30:07 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=WI/PtZoU1ThvIwTW5raLHMrXl7SCP7W8Vc74KdlKrPE=;
 b=Q801g/rqTbMp0KP6+9hI4FzBJHdA0nv7UWWmxghlSVWsFrgc3gUPbDl98zX+kD55wwr4ml6FMrLKe9ghCFUuWseun1m9odt+AazXL4y4jZKgD2j1TG+FA2GruAslyF+DIPKTFOj0T7Etu2g+M1h/6yzzqDXjfcxqN599B+mmFPo=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 05EE463AED;
 Wed, 15 Apr 2020 16:30:05 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id EEEE32DA0CFB;
 Wed, 15 Apr 2020 16:30:01 -0400 (EDT)
Date: Wed, 15 Apr 2020 16:30:01 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] i3c master: GETMRL's 3rd byte is optional even with
 BCR_IBI_PAYLOAD
Message-ID: <nycvar.YSQ.7.76.2004151623060.2671@knanqh.ubzr>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: E3E5152C-7F57-11EA-A798-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_133011_597754_3E3EAD60 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org, npitre@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Nicolas Pitre <npitre@baylibre.com>

According to the I3C spec v1.1 document, GETMRL's payload is 2 bytes,
with an optional 3rd byte if the IBI private payload is larger than
1 byte. The whole GETMRL may also be optional so max_ibi_len already
defaults to 1 if BCR_IBI_PAYLOAD prior to the i3c_master_getmrl_locked()
call.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f8f896fa0..d7e99fb0c9 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -986,7 +986,6 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 				    struct i3c_device_info *info)
 {
 	struct i3c_ccc_cmd_dest dest;
-	unsigned int expected_len;
 	struct i3c_ccc_mrl *mrl;
 	struct i3c_ccc_cmd cmd;
 	int ret;
@@ -1002,22 +1001,23 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
 	if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
 		dest.payload.len -= 1;
 
-	expected_len = dest.payload.len;
 	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMRL, &dest, 1);
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	if (ret)
 		goto out;
 
-	if (dest.payload.len != expected_len) {
+	switch (dest.payload.len) {
+	case 3:
+		info->max_ibi_len = mrl->ibi_len;
+		fallthrough;
+	case 2:
+		info->max_read_len = be16_to_cpu(mrl->read_len);
+		break;
+	default:
 		ret = -EIO;
 		goto out;
 	}
 
-	info->max_read_len = be16_to_cpu(mrl->read_len);
-
-	if (info->bcr & I3C_BCR_IBI_PAYLOAD)
-		info->max_ibi_len = mrl->ibi_len;
-
 out:
 	i3c_ccc_cmd_dest_cleanup(&dest);
 

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
