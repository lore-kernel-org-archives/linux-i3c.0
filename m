Return-Path: <SRS0=0GSa=ID=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263AAC433E0
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Mar 2021 10:03:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16B564DE8
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Mar 2021 10:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16B564DE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iq9dkX//QKEIhM8eaM6dnKUsnRulNDL+pXPLlauJimc=; b=Q6kdneXqcbqgmnOREAWpNNHln
	bBOqCTyECJt3gtgTp6aiOQA/Xc5WinjD6QToC8eZPhn86sQ0rcXD/aABMBUUbKQVjAGdfPqjE5n4H
	QVLF9vUAiZrC3Kci+U9n+kaYBaJtCKbG/DUajhkDkWauRr1bqnht5BTRvr+IZfS4CTYkXis0FEKUT
	b80+TCVMhWCLint/jyPpCXWkLfSOMZ5S2ko5ua6ghkxKgs499DV9mHDiCkPJ/dXkYXJezetXj3mLN
	4goraQZKPQKayv00ZCUYEgC+5DkpMchxvaq6K7TmpotmR8MiFPNxFnfxP++S4ZJvRDvGx7JsHgYk5
	Derz+zhSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI7JC-00EQrF-Eu; Fri, 05 Mar 2021 10:03:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI7Iz-00EQno-4D
 for linux-i3c@lists.infradead.org; Fri, 05 Mar 2021 10:03:36 +0000
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1C9E8E000C;
 Fri,  5 Mar 2021 10:03:30 +0000 (UTC)
Date: Fri, 5 Mar 2021 11:03:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH RESEND][next] i3c: master: cdns: Fix fall-through
 warnings for Clang
Message-ID: <YEIB8rhVBkYxmA+4@piout.net>
References: <20210305100123.GA142484@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305100123.GA142484@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_100333_364423_E226CA64 
X-CRM114-Status: GOOD (  13.59  )
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

On 05/03/2021 04:01:23-0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 

I though Clang would be fixed to stop warning in that case, can't you
push a patch there ?

> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 3f2226928fe0..5b37ffe5ad5b 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1379,6 +1379,8 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
>  
>  		case IBIR_TYPE_MR:
>  			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
> +			break;
> +
>  		default:
>  			break;
>  		}
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
