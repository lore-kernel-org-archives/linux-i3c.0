Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA3C27C53
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 04:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awJLF3m7I7NwXsVqG1v7g/WDlcaCdEu3G+vopquSl+8=; b=nlkhRKyEoMNrex
	jEVDATUwLPEZxwJCESTVra3rvrvyDKt5hsLgJiwcErJyenmSZUdNNyyBHl1VEFltl+XJLmqfgjcFN
	mdftP28dYMFYWfVGPxEvKcAls0NTPhwbUlaSP4KHnpSNJK0SuPKUhEXjqukHdznkgRBSyUErTsD09
	dnapD2OOYmwxUx6zUpyaT6+Lwozl/vQ3OdnY8pbCGF+G218GU0lX9zwfaT1d8yB7fySfVTH0iDL0r
	wDOMxlhN+9I5HAs56SCD1m79fwO6TokwmEQw1Iap3mkY4QldBVadVMP2eb6I00quUhFfmmUrFDWtt
	24DXwM77+Z7kTFo8q77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFR2D-0000000CDZs-1ui2;
	Fri, 07 Jun 2024 04:17:01 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFR2A-0000000CDZT-1xA7
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 04:17:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-44036ce0adaso208601cf.0
        for <linux-i3c@lists.infradead.org>; Thu, 06 Jun 2024 21:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717733814; x=1718338614; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMbihTk99Y2tG0JnDlVtms8BBTQYzqRpGPUu/qD3n24=;
        b=YssTW4CHX1RbyglqzMl64iNME70ao4ixvnhW1fveGaMA4WhvkYgi61elszk+FGO2qB
         AqCwJGP11kx3SSzfsdOopps28ay5EOVogecuDgsJhXND1Qbp+DMcCGYHo5QLmbgM/htj
         Ze//SIS/Gt39FUrLh3+7bUqnkcjxHZy3pHZXZl5IXwCBKiG0I+vsYcE2UDKMVR4KMCZU
         Q70d7VeuPY6SKCdoZPuYQ0orYypDQKvaieNIlSHnCNBVx97om9tRNZjynU8O0dtITTVf
         mbVysOa5UEU0U3gE4536ag3zjRKqUA6JVflB2nDuvDvNpCdqcd7/NOgR/QLdOqIik6hb
         gi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717733814; x=1718338614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMbihTk99Y2tG0JnDlVtms8BBTQYzqRpGPUu/qD3n24=;
        b=wchN1K7OsTgqv8Ji5upJLs1Dnd8f6D8eotXZhEnb8c63xkWk0WYoMXt9NrtaTndcA5
         62F/Jjxdn0FNc9bANFLqNUX5mthOXJtCFOCCkUgtio3iqT/FFMmfQs5+RAtTp02yslRK
         4XI8jI802DtI+dNnkWESK4gwD/W5T58TyosihuhGsuJAV12KYf+/ie3+0kmI9qwLWBrm
         Ts9aH2nhSH6e/GPV51YyJrjuvT5P2Pl2OZ8Kowbrl3JBe30TJNMdgnsGPtPqRCFK1BlF
         HsTR1IaYpoYXorcaEle/X/t7PMPw8XkQZKZ0KRdPiX2DUJ2jlR5OyT4mYUKhENQi3ovI
         CPuw==
X-Forwarded-Encrypted: i=1; AJvYcCUkwhYtVNfxrtrs5/JN6KO8Xz+XSipczOHlTgIb8ybl4++6EM0lFxmNn2FWw+ZAeIX5rq4fVUrGs98Ad1wLTRhHfjKbMw9M8S9kVa06mg==
X-Gm-Message-State: AOJu0YzTzFhnRcu8MMkNUXOgUoXrwlvXsT3H7f/DqBDwDz32IdTOuhqL
	Tya8laXxyPW4/f+LiEQpa1jSyN38Ue6WhJpqlKAQV65MV8GoUMn67ls0V03MYjspACphc4nSsG6
	/2ezAbd8BxtpwxOHcE75v7zwEMtnSc/qTFQLW
X-Google-Smtp-Source: AGHT+IH2a5qXdRfNX/zxko6YepsoTAqxNXFMDSMTGlVEN08PoI6GKDaJgSwsz00DG1hTqGncJ0e9awbuoyXbrHqwh7Q=
X-Received: by 2002:a05:622a:1e97:b0:43f:f0a0:df69 with SMTP id
 d75a77b69052e-4403721dd35mr7985311cf.12.1717733814021; Thu, 06 Jun 2024
 21:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240606124816.723630-1-aniketmaurya@google.com> <3c6c319f3aaa60428fd28f4d95c71dc9a8150081.camel@codeconstruct.com.au>
In-Reply-To: <3c6c319f3aaa60428fd28f4d95c71dc9a8150081.camel@codeconstruct.com.au>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 7 Jun 2024 09:46:42 +0530
Message-ID: <CAMmmMt3u=DB5onXdayMN5ZHvCmdnam4wOo0hKizve4K0LnZLZQ@mail.gmail.com>
Subject: Re: [PATCH] i3c: dw: Fix IBI intr signal programming
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_211658_532134_0454E39A 
X-CRM114-Status: GOOD (  16.71  )
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

Hi Jeremy,

> I think we're OK in this case (just not reading the value out of the
> SIR_REQ_REJECT register), but any thoughts on adding corresponding
> switches in the driver so we can support those configurations? These
> would be represented as DT config of the specific hardware instance - at
> the most granular, just by the specific compatible string.

We can go with some DT quirk, but I don't see the strong need to do this
here. I guess optional registers like IBI_SIR_REQ_REJECT, IBI_MR_REQ_REJECT
should not be relied upon to set other registers.

> Could we use the SIR mask for this, but just read it from a field in the
> struct dw_i3c_master, instead of IBI_SIR_REQ_REJECT?
>
> This would mean that there's no possibility of the counter going out of
> sync from the SIR settings - say, on underflow if we get a spurious
> disable.

Yes, we can keep a SW SIR mask instead of a counter. It would replace
all the places where we read IBI_SIR_REQ_REJECT.
Both methods are okay, but if you think the mask might come in handy in
some situations rather than just the count, we can go with that.
Let me know your thoughts on this.

Thanks,
Aniket

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
