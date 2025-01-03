Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F5FE77188
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jan 2025 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFSomsXC5L5HSZT5Y6kY6TG6zJ64k4QDeXnNdyKSy90=; b=47L5FtXj7ndn9m
	DFUqW0Iv0PP/+hysjxyQ1SiK7p0lWgShaE0nVLen/ZKWN1HZT6bi6vIGs5hCDaPnAQGF2KPnMc8hG
	xkE3TiRznQZZaNEQlJeN7y5qrzXWMTPNKJeMGAiO1yg+ed9Y1twKLd4/w8iB8k37fLTe7e2JsQ2Ur
	85LbAAi3i/LBePrS/jqqKYyp+0CQVkRdPIALtKrZU1DFA/oKQOssgl+l91WLwA4e1I34gwUVx5PHJ
	G5qfo00SkEy0R5YZeexDKhZeTb5NxgaVGHJSMDCj7TyGmh83fTwOJU4Wsl3SIhmNFR8kMXmUDqovS
	yEV0LuqhOSZT6iOe6BIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjZK-0000000DH4s-2aYU;
	Fri, 03 Jan 2025 15:26:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTibJ-0000000D6Id-2p1G
	for linux-i3c@bombadil.infradead.org;
	Fri, 03 Jan 2025 14:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d1BjBUpYqk9eqMI11FfDNE3RMEa0e1lzHs9fDDuyOjI=; b=CHVBZLIzbSWBrPpnUeMht6Kxpn
	1nMOuOxVHQGXODU3sg54/B/hVbCJdRJx/2FidRAxqxWugrjSwM6izt2AWlgTfzzwZt+IidvjjgjjX
	tp2f18lIfEe6zZ2Q9ktL5tVE2XPG3MZir6mTJCkL3S6v6uvCiXebFjIk3gUOkVkSd0CGIcRrsEajs
	WneL/wDhIKXLYpw2hSJAq+arvqOT8fV4k3tuxLtEnN4sAxvqp/avqs+uwhZxE7aoq13fSUZojAx0Y
	LkMQc1fQASPBGMJm9S22VhP4s5bux6jNPwC6oL9aP4hvQn9Jd9iqZDKG4+qZWkB+i7Im0mjZW45j/
	gX0Nmv/Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTibF-00000008Out-2Kcm
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 14:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91C4E5C641A;
	Fri,  3 Jan 2025 14:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7FFC4CECE;
	Fri,  3 Jan 2025 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735914265;
	bh=cJhV01vvkdQGihtqL6AbdNDdrsAL+38nywAOHSb42Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeaHo2+4csy0+w+o0Ull3FgBR4Qyg9X3dKM1Zw5j7ofd1tdY87IY4m2EL4UHD1aOm
	 10zkKMWUdi4kcDOArGPj7VnSGCBtMGKfxoePRA4yKSoZjT5isjacfrJkc5E2WrBFst
	 6/AeecW3BTVJXkQ9zDiXCkTKdE5vSRIQ3bRhqCYY=
Date: Fri, 3 Jan 2025 15:24:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: stable@vger.kernel.org, kxwang23@m.fudan.edu.cn,
	alexandre.belloni@bootlin.com, patches@lists.linux.dev,
	pgaj@cadence.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] i3c: master: cdns: Fix use after free
 vulnerability in cdns_i3c_master Driver Due to Race Condition
Message-ID: <2025010316-natural-atlantic-f2d3@gregkh>
References: <20250103070420.64714-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103070420.64714-1-jianqi.ren.cn@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_142429_917231_F8EC6DD5 
X-CRM114-Status: GOOD (  19.74  )
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

On Fri, Jan 03, 2025 at 03:04:20PM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> 
> [ Upstream commit 609366e7a06d035990df78f1562291c3bf0d4a12 ]
> 
> In the cdns_i3c_master_probe function, &master->hj_work is bound with
> cdns_i3c_master_hj. And cdns_i3c_master_interrupt can call
> cnds_i3c_master_demux_ibis function to start the work.
> 
> If we remove the module which will call cdns_i3c_master_remove to
> make cleanup, it will free master->base through i3c_master_unregister
> while the work mentioned above will be used. The sequence of operations
> that may lead to a UAF bug is as follows:
> 
> CPU0                                      CPU1
> 
>                                      | cdns_i3c_master_hj
> cdns_i3c_master_remove               |
> i3c_master_unregister(&master->base) |
> device_unregister(&master->dev)      |
> device_release                       |
> //free master->base                  |
>                                      | i3c_master_do_daa(&master->base)
>                                      | //use master->base
> 
> Fix it by ensuring that the work is canceled before proceeding with
> the cleanup in cdns_i3c_master_remove.
> 
> Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
> Link: https://lore.kernel.org/r/20240911153544.848398-1-kxwang23@m.fudan.edu.cn
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index b9cfda6ae9ae..4473c0b1ae2e 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1668,6 +1668,7 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
>  	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
>  	int ret;
>  
> +	cancel_work_sync(&master->hj_work);
>  	ret = i3c_master_unregister(&master->base);
>  	if (ret)
>  		return ret;
> -- 
> 2.25.1
> 
> 

Does not apply to 6.1.y :(

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
