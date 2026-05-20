Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C800CD4F54
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2026 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzt720oRO0KvrcTxQdykGmDMskkeGP0Ol9A5gJdTIGE=; b=s3WNuja2IQbX/e
	NK8c9AlNv9w9j7Zr9wbFfJfqjoNaZlfEznI2jqKmIHkrB8f8wsoCOuPfJLaJrUcjz5Rxi1OzwaXNz
	f738qxEh8hvYZJeKTND1HxpwvhZSi9a5dZYBsTiFpLf5h7ptd1CKO9jRqqqKzKkIchVAndQ7x+noO
	/0xsaK3sLPSD5geUfnfSX8l9xnmyixAIK7j+rOxofwzNV59EBQyJeADh9nRKwOvzS2aVrj7DHZqOF
	K9Nr134CxxPvojApYtJmAzljUqg9CHlQMYfug9t1WXWPgAoZ6URb2jCZlA9zyE32whijen3kNp+bh
	mwLO2au0Jz2cgYiJUg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfd2-00000004Vqr-3qy9;
	Wed, 20 May 2026 12:02:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfd0-00000004VqQ-1a3t
	for linux-i3c@lists.infradead.org;
	Wed, 20 May 2026 12:02:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86A7C434C8;
	Wed, 20 May 2026 12:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF241F000E9;
	Wed, 20 May 2026 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278541;
	bh=OwNl1UX/k4o116gRoppXZEvVWlPAyHPJkGrRGNCJ8nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UyMWBeMmGSmmzk0MpyjUc77HHlhoo380oXbCbvkLlsIb35ZCTVHfAG5Dofwh/UKey
	 54zfMhLUiJkrFiyF34Wi4HRApPCuBgt7nnS/xFPTyueuqLAHLBXCSuqxFpzBf+PcNH
	 Q1cSmeOLtnS7aMu9hKvtg2IdGniKxH5HphDJAcmUqk8zkwHEq+nKXSLBwboVVho5Ui
	 98vKMJblYb2tZH85rDCCdaLhh1PegQ+X1pnj6mq/lgMUk7rQsRomhDYkqAUZo3CiLQ
	 cXPrFnI4n300iUH0oCs606Xhp+vzKQU+ai2aerXzg7YOTSv213zBddL1yAC+lHZSTs
	 5sRontRf6EUzw==
Date: Wed, 20 May 2026 19:43:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Message-ID: <ag2eUlweJdgWRKUG@xhacker>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-2-jszhang@kernel.org>
 <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_050222_436767_576971FB 
X-CRM114-Status: GOOD (  19.79  )
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

On Wed, May 20, 2026 at 09:13:58AM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:51:02PM +0800, Jisheng Zhang wrote:
> > It's redundant. This suffix has been in the code from day1, fortunately
> > there's no such dt property usage in all dw i3c users after grepping all
> > dts files, so we can remove it.
> 
> Hm, how could you grep all 3rd party / out of tree users of this?
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 655693a2187e..c4a848cc978a 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> >  		return PTR_ERR(master->pclk);
> >  
> >  	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> > -										"core_rst");
> > +										"core");
> 
> ABI impact for something released since 2018. Cleanup of name is not
> really worth affecting users. core_rst is not the best name but it is
> not incorrect, either.
> 
Hmm make sense.
Two questions: if the ABI is introduced but never used by any intree
users, is modifying the ABI taken as "ABI breakage"?

if the ABI is only used by outtree users, can we modify the ABI?


Thanks

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
