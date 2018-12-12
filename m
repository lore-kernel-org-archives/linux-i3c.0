Return-Path: <SRS0=IOfj=OV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288B6C65BAF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Dec 2018 16:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACA72080F
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Dec 2018 16:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YifJ51v8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5BZaucD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACA72080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gU7MS6cmVtTPw6GMkLqvUK8uuMc92Bn6W7L8/coX0ew=; b=YifJ51v8Ddb500
	wKRrrSg1PAaRKG71SlK6D165KwcIOhpBgOFOgTdDCeTHi87aq8/9KO/Fk2NrNj/9PBl/iiYfFO9Uh
	CbmG7OlxVnfjdh49EZLAjPDLLWtudAjP0caIeEvqs+Vld0rwrAdC4q6qtNRLwvLS0sNpchymCn15S
	jyxjB/ckSYp8xp9VvlaG3F3cc13mT4OYlFWVb9WxZtkZ0vfh1krtRv+TJjoFEXZP1m069EoGXX/rL
	VOpDi3rk/f5I/G7C/7ryGJxUxvYQjBNg4pCezNU5SfVFgN/FwdedRKj7NL60NTQ5WR8Oe/AyDob4T
	S+h1iMigybjVzfKnes7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gX75i-0005L9-Es; Wed, 12 Dec 2018 16:10:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX75b-0005K8-3C
 for linux-i3c@lists.infradead.org; Wed, 12 Dec 2018 16:10:28 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42D4A2080F;
 Wed, 12 Dec 2018 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544631012;
 bh=XXQlzDTT1oJzlZDRKgB5kZAyNJSt7j61tNtJBh/s39A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h5BZaucDhcuTbn+qQAg04ZxVpUDI5hfcWmvF30dzQtptquUvo33CVdq3JG5eyGMCX
 LjYg2lDPGzrbL1XvY601TLIK4tX3DkdvuCSpKzdMISbgE1iE0aJVQF6S7cES7FMizd
 xSCWx48ezrjjxxHh2wmLdBDVgn12JX0atTqxddGI=
Date: Wed, 12 Dec 2018 17:10:08 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH] i3c: master: cdns: fix I2C transfers in Cadence I3C
 master driver
Message-ID: <20181212171008.170be7d6@bbrezillon>
In-Reply-To: <1544614780-21553-1-git-send-email-pgaj@cadence.com>
References: <1544614780-21553-1-git-send-email-pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_081023_150928_08CF0491 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 12 Dec 2018 11:39:40 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch fixes I2C transfers in Cadence I3C master driver.
> There was no way to queue more than one I2C transfer before.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

Queued to i3c/next (after adding the Fixes tag I mentioned in my
previous reply).

Thanks,

Boris

> ---
>  drivers/i3c/master/i3c-master-cdns.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 4f59942..02a8297 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -836,7 +836,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < nxfers; i++) {
> -		struct cdns_i3c_cmd *ccmd = &xfer->cmds[0];
> +		struct cdns_i3c_cmd *ccmd = &xfer->cmds[i];
>  
>  		ccmd->cmd0 = CMD0_FIFO_DEV_ADDR(xfers[i].addr) |
>  			CMD0_FIFO_PL_LEN(xfers[i].len) |


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
