Return-Path: <SRS0=Vv1h=R6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5632C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Mar 2019 21:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFB12075E
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Mar 2019 21:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IXQnUMat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l3qR844x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EFB12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZw97Mgs4QJfXVqgcXRrDw21r/GvFG9BSh2yCKWF+3w=; b=IXQnUMatAcyZP9
	JBlcxnhaHDOiNI2kBWuuTJ10Cd2b8GRddxlCk0JuHazIcv/maEtJtpOp7ut0ghXK5OYs06scaiyZk
	IgbPk7BySG7H/YGQXVGLAy+2NByrzqzZzL2wfUesMlhZ0eRFOXAO7r/+8okr6gh0xIS1qhAic6IOi
	bKkOa+odUYfkvhIV0tI/DHXg2LLsWc9ZhzN1v0f+DyR1BwPp7/8R2oQsUZSaFO6Z7ENctsqIFkIAa
	Ap5quxYZuEUxROvSeL/ijrGzvmuduLnGy4reiITl1vlQep1c0zfTILwLwZsWEk/BrXkEzMZMiUVPT
	qQtHTujCB06RIGqdPuag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GFU-0001g9-8c; Wed, 27 Mar 2019 21:38:16 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GFR-0001fe-Tn
 for linux-i3c@lists.infradead.org; Wed, 27 Mar 2019 21:38:15 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id BB08B10C14E1;
 Wed, 27 Mar 2019 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1553722688; bh=rgdJKI3YvDMlJ9OhbjNLMo8vVfsdskGdTLruljTt5ME=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=l3qR844xyqohI3/beS47+qiE6c4ADYzSbDYFADH+ry8nuL8sth8p3URIom6AyzGZn
 gbXkT0EJX2knMpyJVteZBMc9vBNZme2s81MTnc8QXSaqy9iYbGiYWU0qnbn4n1giOP
 56/yKpzK2gsLsfAED5bmAN73rnkrr92VZhB+J2LfU4lSDmk65vMqS8n4AAr+rsHWQQ
 rvPJDKrtNNNAfBQWZdVdAo+7XJ+v5+xpQVJ9tYL04WFpz3J9VGgfVs5GEm+GLNI5m6
 5EhDFJXo/cLqG4Xibh+UQ9kK1AUPGDLRX8ej3xpYxRB04MSX0yPVYN8VL2gUkX71R+
 DP5scZ/4mJ3pQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6154EA0066;
 Wed, 27 Mar 2019 21:38:08 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Mar 2019 14:38:08 -0700
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Mar 2019 22:38:06 +0100
Received: from [10.0.2.15] (10.225.2.87) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 27 Mar
 2019 22:38:05 +0100
Subject: Re: [PATCH] i3c: master:dw: Fix dw_i3c_master_disable controller by
 using correct mask
To: Vitor Soares <vitor.soares@synopsys.com>, <bbrezillon@kernel.org>
References: <9af6e8d204c7d846b727a9a010b79f1df7ecec1e.1551907779.git.vitor.soares@synopsys.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <e02e8ce4-e392-99db-b1c1-d9b5046033d4@synopsys.com>
Date: Wed, 27 Mar 2019 21:37:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <9af6e8d204c7d846b727a9a010b79f1df7ecec1e.1551907779.git.vitor.soares@synopsys.com>
Content-Language: en-US
X-Originating-IP: [10.225.2.87]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143813_965790_A46CB7E5 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,


On 06/03/19 21:57, Vitor Soares wrote:
> The controller is disable by clear the DEV_CTRL_ENABLE bit rather
> than set it. This is fixed by using the correct mask.
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index bb03079..ec385fb 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -300,7 +300,7 @@ to_dw_i3c_master(struct i3c_master_controller *master)
>  
>  static void dw_i3c_master_disable(struct dw_i3c_master *master)
>  {
> -	writel(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_ENABLE,
> +	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
>  	       master->regs + DEVICE_CTRL);
>  }
>  

Friendly ping.


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
