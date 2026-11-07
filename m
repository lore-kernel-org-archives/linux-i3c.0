Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADEF606A33E
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Nov 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKergi6I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kh7MWo74
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HvSvIgOkv/oxsTAJoMy5Hc3JIpY63/HJmWjcpQbPTZg=; b=iKergi6I3OU+Ctyf26613eUyC6
	Ywe7CAf4o3MstbpQswmg/o9p9PbuSNylPkRNAhqI4tsLRn/c/LCT3XRMfbPBYIvBkiDrLJCvdhdHV
	+j4oZpWhzFmp2kWoYi9hiATC2r7nG/k5CcYB3cpBE6MZdJQQPHOrN/8FD2dh1XdRSR1T9Yap48Lyd
	3PcvLcLalWWaJQMkeGlYjXEw4aikN8dSs+JRvhLajAvxiTRs3xKh1LnCdR3cQ50/FVC5Fpd78TkJg
	+MtkM8Q+xKqxrgaiAerEYbRiRiZt0dTbnh52oOYz46D423J+TWGgWnxlmVmsw7n0V4rQdLFGl20tf
	taskiBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfYr-0000000EgBE-0gwR;
	Sat, 07 Nov 2026 12:30:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfYq-0000000EgAx-0B86
	for linux-i3c@lists.infradead.org;
	Sat, 07 Nov 2026 12:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF6D6014A;
	Sat,  7 Nov 2026 12:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E15E1F0089F;
	Sat,  7 Nov 2026 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054618;
	bh=nr1mAF9XQ5+YqnUwdfyqdWv+PVIL5wfF/9P1RpVYn7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kh7MWo74gdG0A0nfGfPyzvK5EnkGwsd4FoKhligqwHB4eJAANeUEEzpNkM/pNqQmO
	 0eicZzOsjU56DsuysVKysC58IOR0rh1DgTXdyR5sF03qA9UVWh9bkzdtyfS5IT/crc
	 Jr2CV+25eTV0XUi8V9P/ZVa75Lq6pHVIlDqmteofre28QUPREB3xZQdOQS19rErt7W
	 TDFgKG0Gk8Fqaj344Ewt9nunLqBy2JjNomBvuzHQT7/8/WjG+oym4MPLovqBMvZbUQ
	 97Hr2gPBYUIrvq832nhXXpjUHszWU6FllOMOYkruUdXr4CJDT4DBwqnLeHd2JMBlGT
	 SqbOx6gKKX9HA==
Date: Sat, 7 Nov 2026 13:30:08 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20261107133008.7d8f0bb0@systembl0wer>
In-Reply-To: <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
	<20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 12:06:24 +0100
Joshua Crofts <crofts@kernel.org> wrote:

> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index e700392f0801..9b845b2955be 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  	return 0;
>  
>  rpm_disable:
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> @@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
>  
>  	i3c_master_unregister(&master->base);
>  
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> 

Okay, after reading Sashiko's review it seems that this patch won't
be as straight forward as I thought. I'm thinking of manually
suspending the device in the remove() function or just removing
dont_use_autosuspend() from the probe error path. Any thoughts?

--
Kind regards,
Joshua Crofts

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
