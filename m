Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C5AC3A5A3
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264432341B
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NiPZaELV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264432341B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtGUmz57Jf8wxSHkWPW0ssr5BOezQm7vXoixfo8k/uI=; b=NiPZaELVdVNgP1
	CbPcCXOaJP4HD4a2Bh5H9UzNSqLXS7KrVunxbdiUU+lcg5VtSLWjYZ5Qea9taHNdF+UEKWLn7swWE
	zs2nDRuLoTWnMdshRg2gyd4fPm04dNtXLAj9gEeIQlbdEyERB1s2yOaX63vA4ZyRS0BCBqJWF1gXK
	LphQpfMuIz1cOWU6x2j0fiV5yQxzOv/Cv2PXu2Ygidsg9a438lw0YMfWPev0o3MWOnWjXAcVcW0OB
	ek5Eo3vLrBAFczSKX2fH8UlKiI6wkteedvQ+LFFtpfDxcIXXVcGfIw0N33rU9jVn2RM3fPAuP4PGm
	ix0SzUTcXJMHkstdAsvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3I1s-0000dw-VC; Thu, 29 Aug 2019 10:51:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3I1p-0000dP-Pg
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 10:51:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5149428D325;
 Thu, 29 Aug 2019 11:51:43 +0100 (BST)
Date: Thu, 29 Aug 2019 12:51:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 3/4] dt-bindings: i3c: Make 'assigned-address' valid if
 static address != 0
Message-ID: <20190829125138.4b36b8f6@collabora.com>
In-Reply-To: <9d69c83c7193e377bbc77bea7f1812fc17dafaee.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <9d69c83c7193e377bbc77bea7f1812fc17dafaee.1567071213.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_035145_965679_94BB4B68 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 29 Aug 2019 12:19:34 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The I3C devices without a static address can require a specific dynamic
> address for priority reasons.
> 
> Let's update the binding document to make the 'assigned-address' property
> valid if static address != 0 and add an example with this use case.

           ^ you mean static address == 0, right?

Yes, it makes sense to support that case and do our best to assign the
requested address after DAA has taken place by explicitly executing
SETDA.

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
> index ab729a0..c851e75 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.txt
> +++ b/Documentation/devicetree/bindings/i3c/i3c.txt
> @@ -98,9 +98,7 @@ Required properties
>  
>  Optional properties
>  -------------------
> -- assigned-address: dynamic address to be assigned to this device. This
> -		    property is only valid if the I3C device has a static
> -		    address (first cell of the reg property != 0).
> +- assigned-address: dynamic address to be assigned to this device.

We should probably mention that we don't provide strong guarantees
here. We will try to assign this dynamic address to the device, but if
something fails (like another device owning the address and refusing to
give it up), the actual dynamic address will be different.
This clarification can be done in a separate patch.

>  
>  
>  Example:
> @@ -129,6 +127,15 @@ Example:
>  
>  		/*
>  		 * I3C device without a static I2C address but requiring
> +		 * specific dynamic address.
> +		 */
> +		sensor@0,39200154004 {
> +			reg = <0x0 0x6072 0x303904d2>;
> +			assigned-address = <0xb>;
> +		};
> +
> +		/*
> +		 * I3C device without a static I2C address but requiring
>  		 * resources described in the DT.
>  		 */
>  		sensor@0,39200154004 {


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
