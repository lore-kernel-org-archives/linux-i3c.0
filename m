Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5D8C47409
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49842176D
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ifttC3dt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49842176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFepdsAyugvwBOFq44LljjD4HEvYzg+1efz0VZMNEls=; b=ifttC3dt2HIt8f
	u7c/VC9cQYPbelrP3Upc807rmx+REpZYCPZOborqreL2e2E+KB+KraNo5YtdmZBRWjvx0kWUyy1IJ
	34kMn+a5ZBAVqlRAiImdC0GF4P2HLxhX3QAsRKDGBcgEECs/ZEqMOiEdh6/szb1kZEh/NG4cIhrZV
	2e3Am+Y+UvpeykBEJOyjUtzMk5qU1os+k1wmJrybfZZa+XtjT33GlLIKGm4ItGMzEc2f0slqci/hr
	1ItnkAlxT9qYgviucQH4e+W1rc81TYFBYtffO80N475lHbj3rYU4kgJgc1S0I3FEq1tr+7XXdGjCM
	p3U3qCfmcjzA3JkUQlMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE0-0004gm-Qc; Mon, 16 Dec 2019 18:36:08 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iejfd-0008Vn-OF
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 17:51:39 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M8yoa-1ihTEL37TC-0067cp for <linux-i3c@lists.infradead.org>; Tue, 10 Dec
 2019 18:51:31 +0100
Received: by mail-qk1-f169.google.com with SMTP id d71so9201360qkc.0
 for <linux-i3c@lists.infradead.org>; Tue, 10 Dec 2019 09:51:31 -0800 (PST)
X-Gm-Message-State: APjAAAXtQ5hxKg5Eyl9r1FadKsTqQV7RrmOPRpT06tWrCZ660GzO4B6P
 RvyBxh1bl12J318gQG2juWz8dFVUuP+11oILXgA=
X-Google-Smtp-Source: APXvYqwLAiu3+p6iaDMl8EgpIoU3Zkljq9QMkI/BV/wvJWrCucp15nuCsyQOzr2eqfgSN1ubzhiRY5fsSG/rTWJnItM=
X-Received: by 2002:a37:b283:: with SMTP id
 b125mr27668682qkf.352.1576000290527; 
 Tue, 10 Dec 2019 09:51:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
In-Reply-To: <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Dec 2019 18:51:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1cwoTbT3zsa-tfApwewDT1-ksHZs6_vkBYpKbgptsfjw@mail.gmail.com>
Message-ID: <CAK8P3a1cwoTbT3zsa-tfApwewDT1-ksHZs6_vkBYpKbgptsfjw@mail.gmail.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Vitor Soares <Vitor.Soares@synopsys.com>
X-Provags-ID: V03:K1:CTABn9enGe/pWh+5Gs0ObtaP+Fxge+cueJ/NMDcZxVjOEkzSV85
 m3vIh4YH/zDRwzp6kXXl4QsBSGgOxGer+SzL9wGq2OTl4oonYoxGEokisaX0Wkr71OV6+Hh
 RxxUl66tNT/KN5tvr/ALcjC4gBvBnIcklPsi0/f/DJh3J9CRjOJ1dRXUiDu4oUDJLfQq7Bj
 6V/mEY6929zcj8zljqZRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:chvDhZjLoUo=:jWQocv5xW8LZYfewvGXsrR
 zeqHBtKw4D2JyiMeiFeeyb9RauawY5X6IScZg3hO8PjiQX4GN9mEJvuuJJ0h4dWbfJg24UaQ5
 MxbwORiFX9PhoZczVoH8QMujwuZt1A1v7U71MItgPGP93uoARK2FnBLS2q4cGg0CO7I+ji6XF
 k3Ji3bO5cuoqpaVrRzcOVprbNpvOMy+WdBpBBqaYcTkUPqG9eixsFUPmYuz1vlR6P8H0F+aAg
 /opACO6tipB+arO8rL9gF033FQemY+2Vq244IA4rBaU7jU8yzcWLE5Vbl7uUAgcT8gdE2r/zB
 XZh1Mg1GjK4glsmIg738Np2UwLa0bQSLXuZL0u/ZgQa+fHK4GWCuB+8BSUBL2nqcgF2fx4T1D
 NfLRbt+ZvKLJL5lfm3o5GQPqqzFwWO0YoKMy9s1BZZjrp8EIonODip1PMINtuMzJzKmeR51QB
 bJrkDWx2HKuHjKlmDCNOo+ECv7Tys+yc7hcBUHRC5GcCr/0ZReHboZstsPgH9N8oUIFyuJa84
 mGNa3A9xRi4CN4gnGKsjGuiBfJ7PNGuvu0Tm2ScqUsniwVKJb9cxPyQaT6ig/lqwK1Cpn8G+s
 Qm7tocmSHJE2QipI1iki49TKuwhCNBYvcu21zof0UiwNp3qTbAdbfRvFlAF+GnpDfGmaAZUCW
 /srnMUye9MjRZsHxCUiQ2XQj1k7w2sBSuiUv+Hpmh4QdeFCm7JCGt6NJV+B8A2IGnTwoALnj5
 nSAF8raPlPbXmGvXJS9DSsxOdzeswvqwk3hr7FAJXrNwXiTun0CZ4N8FmS2zg2DrrtFesJCyj
 tuRIjn0h99Iph53V2MEGIQsOahts7uWDzcmB7gDpPwaLfuqQuqeM/xQCVY6/jH56JENFb4jn4
 Aka5LDvv8Ik4vd0Jn/Kw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_095138_088253_BED6F279 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 16 Dec 2019 10:36:06 -0800
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Wolfram Sang <wsa@the-dreams.de>,
 gregkh <gregkh@linuxfoundation.org>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 4:37 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>
> +/* IOCTL commands */
> +#define I3C_DEV_IOC_MAGIC      0x07
> +
> +struct i3c_ioc_priv_xfer {
> +       struct i3c_priv_xfer __user *xfers;     /* pointers to i3c_priv_xfer */
> +       __u32 nxfers;                           /* number of i3c_priv_xfer */
> +};
> +
> +#define I3C_IOC_PRIV_XFER      \
> +       _IOW(I3C_DEV_IOC_MAGIC, 30, struct i3c_ioc_priv_xfer)
> +
> +#define  I3C_IOC_PRIV_XFER_MAX_MSGS    42

This is not a great data structure for UAPI, please see
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/tree/Documentation/core-api/ioctl.rst?h=compat-ioctl-endgame&id=927324b7900ee9b877691a8b237e272fabb21bf5

for some background. I'm planning to submit that documentation for
mainline integration soon.

     Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
