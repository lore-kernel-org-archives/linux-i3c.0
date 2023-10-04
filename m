Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B3E7B61F
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Oct 2023 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvuPloibzw66o0OcmiXEzUztN+GgZTmzBYCPxoYlEEI=; b=kyNNmjyvFxuxh/
	PWgeBIe1EvlxZ4Y0CVPJXuuKQ86PAvwaPLFfoKzlzS18bXPC9CPhHt++ODbYXmN4lTLOxwbACdac3
	jEQYdhbBzKy/ZQgzcg7razkXCVPvQZBDqsNRsCZIn1QRvz9M4g3s1yGBILKd00FtHmTagxn0GYOvG
	Q1x1ZBQIk8jGeyX5usF+LG8xccWWA5LdQX7mGuZKg04MVtMTDtmckqpUtr4LKrzlJL+2v/lGjoz3Z
	+k0t840Zt++b30f8L3+yprgXThANh+E7AdhcLirK4lEdAE9r0bVYiSDgKaHT5RrWUl0ohHW7wOj8L
	N84Am6xhCPwheKetOrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2gd-000CYO-1C;
	Wed, 04 Oct 2023 14:17:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2gZ-000CXJ-11
	for linux-i3c@lists.infradead.org;
	Wed, 04 Oct 2023 14:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2AF27B81E71;
	Wed,  4 Oct 2023 14:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DC2C433C7;
	Wed,  4 Oct 2023 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696429027;
	bh=7ATEAWA0d7zV8d/5xNEL0X8Ri5dFJxCHFsqlexmSiBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dk2zLmLMjH5d40IXFZYdPRHHLKWzHMqK22+XJxltzmW9+6Z3ug98wz0PWKyP1D0mM
	 fUnALGNB15FyyiuLacLUpxgIwbvZTyQH2i/W7vVJohna1SWY11R0+PJzXqKJMs8D9p
	 Uj7gV3nqcIdHtmgTYJsUPQdNIeT8EMOIKPaf4CSZ5ojc98AKILXzLaD0Bi81vAWbpP
	 Ex5ri4uGStvhnv7cIaT0vv/ji3rKCdKYLb28CAlvJ6amazAefoEKdA9hRm46kXd2Em
	 4WCzu4Eis6Ae/gOCWloziRf5pUSp/3Fkkp/09If2pZajoh5naEBlJJFOIOXC7VPjzM
	 fGqaXYZ7sFOUw==
Received: (nullmailer pid 2959614 invoked by uid 1000);
	Wed, 04 Oct 2023 14:17:05 -0000
Date: Wed, 4 Oct 2023 09:17:05 -0500
From: Rob Herring <robh@kernel.org>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Conor Culhane <conor.culhane@silvaco.com>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Message-ID: <20231004141705.GA2947549-robh@kernel.org>
References: <20231003075339.197099-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003075339.197099-1-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_071711_493861_F7D2CC27 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 03, 2023 at 03:53:39PM +0800, Matt Johnston wrote:
> The MIPI I3C spec refers to a Provisioned ID, since it is (sometimes)
> provisioned at device manufacturing.
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> ---
>  Documentation/ABI/testing/sysfs-bus-i3c        | 4 ++--
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++--

Acked-by: Rob Herring <robh@kernel.org>

>  Documentation/driver-api/i3c/protocol.rst      | 4 ++--
>  drivers/i3c/master/svc-i3c-master.c            | 2 +-
>  include/linux/i3c/device.h                     | 2 +-
>  include/linux/i3c/master.h                     | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
