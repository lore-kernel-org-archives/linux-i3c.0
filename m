Return-Path: <SRS0=A5bS=LQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661EC49EA4
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jun 2021 15:10:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC88611BF
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jun 2021 15:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC88611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/s0cTwUqUMa51GaXrsw5yEIb+bcerr0ySAGCyEzLTQ=; b=ORbhQG85Ge7ApF
	YMz3IGqFCVLevPOjcf0BsmRAvBa/55Ah1grTT6ZYFZQk195s5cjrVSljHD8T/Qs9hF68c5CVHNQ+Z
	aa/Tcyt2sxzB0UGWxr/OfvUoyniIzDP9I/cK1xz51xY0mllWAZpxBn6FzZX4sBg5igMaTVJhi1PzX
	6lhNDgf9QmlAVdhAYdNyT41xtClFeyozHo4Ok5bsf9wYMTyf9HQKeRh9bERSZdTgp8gJVNlgDFdf2
	kM0fehQ9xkrqvOQ3wdOLrqzHI000QNqsMF0Lon2nqOiN8nS7ahFHj338bj98NiVI3M+zsc4Znwp5h
	BaqTvIw+6I7d/0olYwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvi33-007cSl-0D; Tue, 22 Jun 2021 15:10:45 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvGU6-002xv7-Ss
 for linux-i3c@lists.infradead.org; Mon, 21 Jun 2021 09:44:52 +0000
Received: by mail-io1-xd2f.google.com with SMTP id a6so6375411ioe.0
 for <linux-i3c@lists.infradead.org>; Mon, 21 Jun 2021 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1TJ7i7KgvD4fdVHGJRMyrwZBOAJHAbvbRMumj5+UHU=;
 b=oEH8oXFU370Br9g3znCrw/jxIio1QtFBa5A6CP3kUeuS19QSTY3vKt9nrCSZuKBVTi
 5brliEyrr6r8ljXgjJMpyq43ews7qe56KFUuDJxzbJcL9WSPWymyu7oXKRvhk4GiAZ+3
 bLG9WD/aVpzce5J7dH9/+j18PKYirkUpWvUcEIhoSXGcnRXKncDUz+2KoxSQHajjMtrh
 Lj2MfwxZGzKGt4KClbBqfBPz1ThE/6Od+9F61Wqk66CGQnRf+k+tV6cvO/iQ8cWlxUWf
 12ef7wufrr92vtA4YaUgHSigOr78dB94tlRU6ur0x/lc4ColXAz8QnaAIRXtcVd4jLQd
 Knbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1TJ7i7KgvD4fdVHGJRMyrwZBOAJHAbvbRMumj5+UHU=;
 b=L/y4hFQAXxDHX9BKbcE1jtCbu3TnYR8gS5KDyR2bNh5jLSMVu5hRtOCPnsq0nE3iNS
 Q2uv2+lw9zrmBAotet2yYxpIo7aAJCfMB3OiFArGu/rcSu06HHuZnfgAcqhxo2meSVU/
 AKs/jUSgGhVnbDkkoR6OC2xV6wpPUDAAjhvPnsLcv+ZgyXYZeKQ7byT9dXWrxAcd/C1m
 DwwGEyr5IzlzKlZc9RzSlb1UNbkrA8sYcAUL3UBekgqRfAE06U0G8C2mZ0Qd6m8Cnj8C
 BT38k+X7aMPZZ3R1fOO68X284nP86PVGCahdcR60yBcD+MPwYo4sJoDdK7MQcXdjGTy3
 N6MA==
X-Gm-Message-State: AOAM530KhkYxKFXw+TkI9des55PAYa/bxYT3xq2uO+5ILzOj9fqm2M0H
 GRkWHw7FzB0cd7wqVQfld6SdKC8/Up1qR7CkT1tgLg==
X-Google-Smtp-Source: ABdhPJy2/hr3Yxo3hr85EvZD23OIDokym52uhxrGItyfkdlVu4ZgoBws3YJE2JUHydA3ekG2826MMN/wIxMICXR4ifo=
X-Received: by 2002:a6b:5908:: with SMTP id n8mr1139742iob.185.1624268689710; 
 Mon, 21 Jun 2021 02:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624266114-21539-1-git-send-email-kewei.xu@mediatek.com>
 <1624266114-21539-4-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1624266114-21539-4-git-send-email-kewei.xu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 17:44:38 +0800
Message-ID: <CA+Px+wXx8eyh2QFRHbkf3ESdXzBw8LNqP=jMihju+jV0TpQvhw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] i2c: mediatek: Isolate speed setting via dts for
 special devices
To: kewei.xu@mediatek.com
Cc: bbrezillon@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, 
 mark.rutland@arm.com, linux-i3c@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com, 
 liguo.zhang@mediatek.com, xinping.qian@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_024450_993718_3F8F27E3 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 22 Jun 2021 08:10:09 -0700
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

On Mon, Jun 21, 2021 at 5:03 PM <kewei.xu@mediatek.com> wrote:
> @@ -1293,8 +1355,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> -
> -       i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
Looks like the patch removes the line accidentally.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
