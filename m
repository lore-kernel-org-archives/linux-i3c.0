Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92E606A31B
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iSUgfZm1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma26LA6K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZLBBNBj8dWbMx+Fkklx2I4Pgn2EnAgxk4Syk+a1cPSs=; b=iSUgfZm11/DzheDj4D8YTKD7/G
	NXlC2/NngfcymtdIQqbABgmSYtbjtTbHy7Nj5UFD7ZbSSO+Xh1cLcolO9K0k50C91YNrqwyIRJdU8
	3KOlX9s5fZOeczJ/hnBKDieg2OESTUn8CGM2XJnEzdj9mOoH83TdUPNcvGlArR19FyXyYC4dPHsky
	Upb7KWJ5fKKupaKC1fcI2BFH6Q6DWY6EhrhlfD6dOC+h74/b7iv3cWDu987+kftajt2IYL2CRJJ0g
	WqFJEu23np98fMZRboJkXeFZ1WBsF7rrE7GnabH+mjRumooTk7BGZJdPhXeOM6C/4wwHAMxY3wET9
	zwSFSmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAdR-0000000FviB-47QT;
	Fri, 23 Oct 2026 08:28:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAdP-0000000Fvhp-2IZm
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 08:28:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5047440101;
	Fri, 23 Oct 2026 08:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA7B1F01828;
	Fri, 23 Oct 2026 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744099;
	bh=tbu6KQCYR0HIbEcZ3PFIb172SAM08206TRIlFmm9r2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ma26LA6KRJ2xmPXLEtu4nqIk5Fexa/c+6M2S5CrxTBtPYsMJo6Hjv2LrTNyrvCd2o
	 FwnZb0wiJtzOgDffW72jwfj6sr0H6KX/wEDXDXvTSEy48/bw8gHXu+zbvjH6BihmUy
	 RCN/MUxb6SdmRS9Zb11QejLUoesen2m++WPx0cQBWp1hNZsp9gYnw6413FpLox/pDL
	 3blYZ+P13T7QnFz+LXlG98gVQVg7DEpE3M/h/lFnNCSZRXW8kJ8EvyQL4ew64TtURw
	 FiRLOxxSRDGuCY/bR0YywD5eb8Q095tKRlunL1YmihY4kEgn5QJzMdMp+LP6zgNEDz
	 gtgdcJ0gVDcyw==
Date: Fri, 23 Oct 2026 10:28:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Message-ID: <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
> table.
> 
> The controller is very similar to the IP on the RZ/G3S. However, for
> instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
> RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
> therefore cannot be described with the RZ/G3S compatible, as its bindings
> require at least 17 interrupts. The same point applies to RZ/G3E, that
> requires 3 clocks while the RZ/G3L requires 2.
> 
> >From the driver point of view there is no difference between the two
> SoCs: the driver only consumes the tclk clock, the presetn and tresetn
> resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
> all of which are among the 16 shared ones. No driver changes are needed
> besides the new compatible.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 4fddc1b4fdbb..80a6df1151bf 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
>  
>  static const struct of_device_id renesas_i3c_of_ids[] = {
>  	{ .compatible = "renesas,r9a08g045-i3c" },
> +	{ .compatible = "renesas,r9a08g046-i3c" },

So fully compatible? If so, drop this and express compatibility in the
bindings.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
