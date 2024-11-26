Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311E9D10DCF
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Dec 2024 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hp34fIj9lFOBTaFOcsXrTUROVIBisWmYpMZ4kKPDEW8=; b=t9NnQG/vnY+7Me
	0zf0POpOhVixVF2TAz9SCMCvKF4FlCPVrzZT37IiIDD7svoNLYql5BkNBmb4STEo8c2ulo0vO3VfA
	3J3j+JOIhvet3Len7mQb/ejFZ3wxZovJ3W4clOkG9GZ5e5Kv3BPNX+m8s3+Tn4ILWGx3ljUpw6u0h
	h5Q2tLBW3eZCc+wMkTPjnzTBZeDJTd16m/QQDrX5eN0Z0yhkXWHsJkNdKVO+7uf1/9LGPYclymx+T
	h9AUvrdox/8y8Lg70JC5wQIetXkyE/U488qp17JCG2jjDkpQ+BEQf2tutAjY74bKiTtMY1mnzW2Um
	zGkwBzN6CDeZXFVMkIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2NQ-00000005VNW-2lAM;
	Mon, 02 Dec 2024 09:05:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1fa-0000000BZrb-0ouH
	for linux-i3c@lists.infradead.org;
	Tue, 26 Nov 2024 19:56:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so65055691fa.3
        for <linux-i3c@lists.infradead.org>; Tue, 26 Nov 2024 11:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732650980; x=1733255780; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TAXLnsJ9MnYPTn/qVkCr7dLpK+5QPdDJCLD6D2e1H24=;
        b=cKvta6jm8XrRfPbxLVt9jnov7ezlTS2fcHbIWC4xJhDXOUU6odVi4SFj0CebPate7J
         LpJMF0WSjKIYPAxrh5neoDZ9rGrbjNEZzgA5O6bHtRmZ64IeKtmjFDIVDV0QoyiEKO/g
         W70M4xi1wExqujPGSCHuMrjZLQadyS7iRz7u3ss1EIgYSoXwdd6HORmgQ0LZ/wbXhYcv
         f00a7r8uM1UJYK9odbT6BGps+TAeNtyCp+U3y+TubL3q5oVKziU+mSqKrSqlgN/jwsOS
         BOaowfjw7SwKys4v42PRYDdi6Ynr23Nu3yaaOmAMXry/BDHAqfo5DzGfkeyowsAdpPpX
         Rmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732650980; x=1733255780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAXLnsJ9MnYPTn/qVkCr7dLpK+5QPdDJCLD6D2e1H24=;
        b=ttbLfBMXdVQNTja+Q/yQhhoNvsl2o8HUWDuhX+HLH7bi6wezwDfc3cvIBMP51VJvOq
         Djpm65a3x7KihAdliL6DjZk7+Lc4RLAoNV7XP09k1/p5ENRY0gIFRSnkJ4J38BdK5k+T
         9SAZGwQm8MKMHnjgAx+vYqqYOpfCx7/qMs0t7GTyIt8MIQC/PweBs3f9Ui+4aFHczsqv
         39TfTPWNHxq0AV2ng1EKmrPxG016Getrnhn/FpTe45DlNmQ7HsxwYH6vDNSHKdWt6mC5
         V7/A41rkVYcbO3RoEY42NhE/oemg11VXo9mvKIXsRrG0RUNOPxP9EZi0cma5Q9pvXj7T
         TTog==
X-Gm-Message-State: AOJu0YzYCRWCga8pa+xYoxMabFHnjHNl48MyltuI7PpTpa+ek/R/w2MV
	QilHkot3iHay3x8WPjrjRFptZnQkhlr9dCe3Md7osQA4hyOQT1AsaELpfNLrAnamXqVvS8k4eG5
	Y4LM5ZM2jj4iwgJsr8fUVXqapHlT5zw==
X-Gm-Gg: ASbGnctetZRZe4oFWnPmixTURS5vSN8syszIHeSXhSbL5Pf/6hkk55w82k007xRTfYa
	xXlJqBJWlHFUXwY6OEOn51l41n69vFdNmuoOtCcI5s9ciZqfpNdMZdg8bXqPX
X-Google-Smtp-Source: AGHT+IHi2viNGov/xAOg7tpvDDkEV2owpY41NuPUMpQ26y5S2VsCewxUWleNfs91G5yA6IaVNhsUcEKTvMZUQaAAVq8=
X-Received: by 2002:a05:651c:502:b0:2ff:c016:f293 with SMTP id
 38308e7fff4ca-2ffd5fffcb5mr1895361fa.15.1732650979492; Tue, 26 Nov 2024
 11:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20241119153941.8307-1-advaitdhamorikar@gmail.com>
In-Reply-To: <20241119153941.8307-1-advaitdhamorikar@gmail.com>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Wed, 27 Nov 2024 01:26:08 +0530
Message-ID: <CAJ7bepJ9vd8s4Yd+HpvGyZG3PE8oK8YPMFxtkPRO-W-t-Pe63Q@mail.gmail.com>
Subject: Re: [PATCH-next] i3c: master: Fix potentially uninit variable
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_115622_231254_8AB354D0 
X-CRM114-Status: GOOD (  16.58  )
X-Mailman-Approved-At: Mon, 02 Dec 2024 01:05:09 -0800
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

Hello,

I would really appreciate it if I could get some feedback on this patch,
I would like to know if this approach is the right way to proceed.

Thanks and regards,
Advait

On Tue, 19 Nov 2024 at 21:09, Advait Dhamorikar
<advaitdhamorikar@gmail.com> wrote:
>
> devinfo is uninitialized if the condition is not satisfied,
> add an else condition to prevent unexpected behaviour.
>
> The variable will contain an arbitrary value left from earlier
> computations in `i3c_device_uevent`.
>
> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
>  drivers/i3c/master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 42310c9a00c2..7594d3793eb0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -284,6 +284,8 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
>
>         if (i3cdev->desc)
>                 devinfo = i3cdev->desc->info;
> +       else
> +               return -ENODEV;
>         manuf = I3C_PID_MANUF_ID(devinfo.pid);
>         part = I3C_PID_PART_ID(devinfo.pid);
>         ext = I3C_PID_EXTRA_INFO(devinfo.pid);
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
