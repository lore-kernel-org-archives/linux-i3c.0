Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AE606A326
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Nov 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0ocLTFQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kV7uWx02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2x73bZZ6aVXviJl9wEqpqb4QOC5TKySydLJxtf2vGzk=; b=v0ocLTFQuWqH5+apIB31Y0m+uz
	IpFDOz7g3OlSkmqyaXt41GqRZkr3qsTvWo1a2xO8nYPyNglv75AGVwfr+58vmpqwCuPfYcYgswB8P
	iJkNoKyqdQUugtIRw6RriOeQxK9Hug+D7+BA3+wTL93gqc9H0vpTKpXwhp/clxmZZ5r2Aw0ngj39W
	EIG9iWuYg8UiP+CxmYi4yCaCfx91RgkYlC0Jy1OttAZZjlxxKmm1Ykqn2P2FyYmBxn1B81YEscjfn
	mla9iK+2DVPirS99pVabp4KrjpPL19gfb9G2ItxjuRl+Yn4uCbM59QX4jpu1tU+sxxyNaOZxLqkWf
	nyjQ7xTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvc4-00000008dtU-1P86;
	Thu, 05 Nov 2026 11:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvbn-00000008dse-4BPs
	for linux-i3c@lists.infradead.org;
	Thu, 05 Nov 2026 11:26:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7705840F7A;
	Thu,  5 Nov 2026 11:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9825B1F000C1;
	Thu,  5 Nov 2026 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877979;
	bh=C1hrqNfab2BUyeQ19amVpDlqCunra+cEiy/RJrNmaJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kV7uWx027yJNBJV681LZoEv5Bq9G0Br+8GS0AUvEyFZR+1OLxWiSV8sXwwsRe5bLk
	 BIK9S4QaLJE5aN26WFS2dY8USE7ULwRmuKaMugMzZh7FH7w4VsnjeEzlO6r4whbAG2
	 4NwEbDt2/RNKcwWEwOwqwZ2Kv5CfWAyDj9uos1kGHiYeP+UJWMZfZxJsoa6RxxUJmz
	 oqlbi8S6NLYzfHEnaMFqhKkimoY6TmTdnF2QiBs0yx5zjd1EFOLmXvliOUWYaNyrIS
	 UVvLyV0mIvxqoEwFan24dInFGdHn6C542Wyx1zQoPnK4GWUAbNKpnZzE0WxVCzP6q/
	 OAYY5BHoU6byQ==
Date: Thu, 5 Nov 2026 12:26:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com, 
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com, manikanta.guntupalli@amd.com, 
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com, 
	alok.a.tiwari@oracle.com, konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, 
	jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com, 
	aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <20261105-nonchalant-groovy-manticore-76d2a1@quoll>
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
 <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 06:01:15PM +0530, Mukesh Savaliya wrote:
> Apologies for the additional email. I missed including the cover letter with
> this series.
> 
> Please ignore this series without the cover letter. I have resent the
> complete series with the cover letter included.
> 
> Sorry for the inconvenience.

You got here some Sashiko review, so that has to be addressed.


Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
