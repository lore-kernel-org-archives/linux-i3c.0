Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A5DC2BD09
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Jun 2024 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2d1K04D46DsFk+6dFNiWZMT5pQrqBF/3kT6XdU38Y0=; b=IJCC+bdHgNWtZJ
	9dJ/s7peIhXcB7twBKQXRJCAmG6en5PvelckgdtJuQO+1rIXQR7c+wQVPYO9rEWrUjEDTECcrn6AF
	WseKPYD0k9U1qbDqIfM+dTwYxGeQCp4/lnRUDjlbMt97/UldOyk3UOP8kovNXTcjPTUqJ88JlNN56
	AEZYlg+/Zwoge7Br6RooTJH6E9u1VQd6NbpCbdB+NPwef4rdX1F1Ei3+4lu81sSf5pXTeOtf0bzHZ
	A8lo0Cf7HlxY7q6je7Jmazbaqo5/A72V/1LvqJ1fyCPLIMq3Yzer62vLb/NuAaoAAjcyy+2mC/llG
	lhEJcpEOQZ8wVI/jGKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sND70-0000000E8RQ-2h92;
	Fri, 28 Jun 2024 15:02:06 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sND6w-0000000E8NP-44yy
	for linux-i3c@lists.infradead.org;
	Fri, 28 Jun 2024 15:02:04 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-445022f78e1so265291cf.1
        for <linux-i3c@lists.infradead.org>; Fri, 28 Jun 2024 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719586914; x=1720191714; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pV4F7RdKKxqX+CEk9cel20GI2s9HbIhc31hrc3gEuKM=;
        b=fCFmXcDBN04MgpvzsKdcMaV00Uw2EKN3jfgFwKWz9HwjZPO87gXDOM1wrl0Rf7fFEs
         vud4FSNKRdHUU06NOEIfE52SkN1SWPk2zyrhPoU/sVDs7Ec+E7XESSjgJz9VjugxnAoL
         1Tlq8mccA7iOd08Opja18AJ+beTaACI1jd7KACGBwljkEHAxuqIKXnSiYuyd8v3vQzN7
         7xxdvO45OWYELdCx6HTXSUVTh1g2M8V0j0nnRvQEdaAYnyxtqH5qv9u8oWMfxuHQKEnF
         xLXHEq+/UVhIuaqrY/lwGxyaD0JkbZuJA6/OtuNjfNGZdJcz5zLtYXBWBRT0+5H5ukUO
         wuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586914; x=1720191714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pV4F7RdKKxqX+CEk9cel20GI2s9HbIhc31hrc3gEuKM=;
        b=Q5GruCg//XHr0OYZMm0/YDXhZ/xVswztwmpKnIH7FnPWzYhF1EOgZj0A1hJgmNTO1u
         8+PBdnaPtnzGXFQL59aiI5wEcE232i6KRMg3fJBO316iAzeL1yB97wT5oSGs+qksgndO
         ceeSdOirADtu96+fDJg1WUFy6d/icC0fnY7+ksxoFi1366XfebcfBMpzw5Wql4W4HZIq
         Yfzh6PHOKpl8VOUq0oEBwN088DfiGJq0W9Ku2s4HiEhKgrywr4A+qRaym7ZVFUOcG9r0
         Ie6dsk/A8hVRJZLl/5IwBU791l14UM4i6CsZLWvMjm1JdzLe03TfcKReSg9nQ6xQ1fpp
         nYUw==
X-Forwarded-Encrypted: i=1; AJvYcCVjg+mv4A+PH5/6rFL4ZLpZZZD2AhAi/KeXagriJs7aNz3WGlTcnm9OKVp1U1nWAiG2CGzNuYa05DifavIk6URuOWtSrTsw620+mnBmFw==
X-Gm-Message-State: AOJu0YxoMQWyLb/N7qhyZ4YCw3iIoiIM7nSgWbjCefVQvUNv97q9W/d0
	wUvoG21jCNCDLuCbBlrcY2ErgfXU3vP605tsuO4CEy5kSSGzQUAjKstTDi5WhfwJHFUv/2WQs8B
	8dgttZ2yh53j/cL6GIE9Od7SAGZKpvMoQ4N0Z
X-Google-Smtp-Source: AGHT+IFSa8ePRVVy+0pw+2BgpZBsYhEdqdOqUKgO/gqHs/9djL6GlfhMWqhA6kA1DlyLbQRpSh8UWRI6Jz7YD4+eot8=
X-Received: by 2002:ac8:45d4:0:b0:444:aba7:8c07 with SMTP id
 d75a77b69052e-44651b1dac0mr3382951cf.18.1719586913372; Fri, 28 Jun 2024
 08:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240624052851.1030799-1-aniketmaurya@google.com> <20240627221225e3517e4e@mail.local>
In-Reply-To: <20240627221225e3517e4e@mail.local>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 28 Jun 2024 20:31:42 +0530
Message-ID: <CAMmmMt0GKHaTbPbY_qubw09TGnAkVO+M_EAZB1bLZBQ3Ev3iJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i3c: dw: Add apb clk
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_080203_035471_3DAFF396 
X-CRM114-Status: UNSURE (   6.88  )
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

> >   dt-bindings: i3c: dw: Add apb clock binding
> >   i3c: dw: Add optional apb clock
> >   i3c: dw: Use new *_enabled clk APIs
>
> You should reorder your patches to have 3/3 before 2/3, else you
> introduce code that you immediately remove.

Ahh! Sorry, let me fix this.

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
