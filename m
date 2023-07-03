Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20682C30659
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/0qFcLk7K/GLQW2TPDapvQioYxClUkdz6Oj2seHNfk=; b=uDXUIsgHf8wZaA
	Uux4nXVf4ZUzwHB8dUgrRJ5ntNbTwjfBDBZvJVYadEy3RWDsf+vlRJ3i4cXLOlByywCGlqmYBsppI
	XiD8glUEsgYCyjTn0qixbL08JgAZIpCkWHFgqT5mCO2duesXQDiruikxbRh+/cULL1qnnz6Sw80BL
	RCXFJ6+2I1So37BWQfKBy7sHX9xZuDJ8xWmyZs3AFBcC40bxmj4EBRPZH09grJeknEC3LpEeioj2r
	s7/w4FDbHLEuMr2f2SMWCLwbZKF84bVGSgJzk7vFpeZEows5oWiyH+b6N5WL1jXRYLLKlQhzCL9i9
	RQEXV5lGyXhfXLuRIGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQLL-00BPFB-2M;
	Mon, 03 Jul 2023 20:40:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGL3Z-00AokB-0F
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 15:01:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98e011f45ffso428300966b.3
        for <linux-i3c@lists.infradead.org>; Mon, 03 Jul 2023 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688396495; x=1690988495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIdAV5V5KAnS+h+qxHS03r1FUQFpj/gJ3vvk0BEn92E=;
        b=ifmaivl4Z+J5L8F8MKx5XFkvPydvR4OFSmVCDYgNVzdBET5oxRjmyWnN2kndVisi4P
         lh0KEoEm0nCh+Ao5XN1cGX5wQaxlfgIqV77vEmp7203tbGymfBI0Rq7akosGTOmg8Wf8
         PmWQMd5NuMCt2/cyDk13+/PjRrrJWrMrXJShpcAI37eAsBCWmcKYJtNcJ5raUkOwtyAk
         Q35E7HeaXRJj7Jt9HW1ZVoD9ofYkcEmiBQGtfN6227PPbG9tO5Y4MLtEEOnLm1/6EuS2
         vZw7pZBeqXTIklfShbq6TVnnpRut4lKaShTbszCmBOV//5NapwMjQGtaJuGV2iVjzIQg
         bLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688396495; x=1690988495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIdAV5V5KAnS+h+qxHS03r1FUQFpj/gJ3vvk0BEn92E=;
        b=kXHHwIR0b26C9atmB+gmg71lF+fqbe3S8GOiwvpkzlZBJRqB2ba4fM1NtUNRVEVSjm
         jjbPA08kKAvBPN3aAo4pR+NnTVpipVXeQRZKWUbVPKdF+e5ARN/PclpkLDWS5nDtJqiw
         7G/Qq1gtk7xTco/7uXPDFBWrEcM/HY3dr0PT7Y9e7jzw0wjysf8oBfJkAM+5BkC2fJXF
         AhfrHLrHQluDsjKI+EdkBN2gfec8rAZMezYAhC0sDZ30DM3+n9uwf2SItbpyDx2r86Nq
         jn4i6ITO5s3VTWONAsXICa7DDxFJerMC5QGsoKIWLSxN7yvY8+0sbGrGItfiZAf5Dn7X
         XIHA==
X-Gm-Message-State: AC+VfDxd/x2FXsTRVlfwrDFlW7NIytKpBZx71ocRGX7DNYp1XG6+qFZ2
	/bGRo9fVbaIOlwHhLuWdtixJEQ==
X-Google-Smtp-Source: APBJJlF4nZmviyLst8bq9ovVEqJK/HZkrp9/ry8hWn6K/xwqIxJjlmWLVSf2GEYdGeflLlSv7IOP3g==
X-Received: by 2002:a17:906:8699:b0:973:d06d:545f with SMTP id g25-20020a170906869900b00973d06d545fmr5693067ejx.24.1688396495465;
        Mon, 03 Jul 2023 08:01:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id h22-20020a170906829600b009931a3adf64sm3751695ejx.17.2023.07.03.08.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 08:01:35 -0700 (PDT)
Message-ID: <56c0783b-59b4-0eda-5a9a-ceed53ebf41d@linaro.org>
Date: Mon, 3 Jul 2023 17:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] i3c: Add support for bus enumeration & notification
Content-Language: en-US
To: Matt Johnston <matt@codeconstruct.com.au>, linux-i3c@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
 <20230703053048.275709-3-matt@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703053048.275709-3-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_080137_119662_9CB7B824 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 03 Jul 2023 13:40:17 -0700
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

On 03/07/2023 07:30, Matt Johnston wrote:
> From: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> This allows other drivers to be notified when new i3c busses are
> attached, referring to a whole i3c bus as opposed to individual
> devices.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Your SoB is missing.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
